#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

#=================================================
# PERSONAL HELPERS
#=================================================

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

ynh_local_curl_csrf () {
    # Define url of page to curl
    local local_page=$(ynh_normalize_url_path $1)
    local full_path=$path_url$local_page

    if [ "${path_url}" == "/" ]; then
        full_path=$local_page
    fi

    local full_page_url=https://localhost$full_path

    # Concatenate all other arguments with '&' to prepare POST data
    local POST_data=""
    local arg=""
    for arg in "${@:2}"; do
        POST_data="${POST_data}${arg}&"
    done
    if [ -n "$POST_data" ]; then
        # Add --data arg and remove the last character, which is an unecessary '&'
        POST_data="--data ${POST_data::-1}"
    fi

    # Wait untils nginx has fully reloaded (avoid curl fail with http2)
    sleep 2

    local cookiefile=/tmp/ynh-$app-cookie.txt
    touch $cookiefile
    chown root $cookiefile
    chmod 700 $cookiefile

    # Temporarily enable visitors if needed...
    local visitors_enabled=$(ynh_permission_has_user "main" "visitors" && echo yes || echo no)
    if [[ $visitors_enabled == "no" ]]; then
        ynh_permission_update --permission "main" --add "visitors"
    fi

    # Curl the URL for the CSRF token
    data=$(curl --no-progress-meter --show-error --insecure --location --header "Host: $domain" --resolve $domain:443:127.0.0.1 "$full_page_url" --cookie-jar $cookiefile --cookie $cookiefile)

    local code_line=$(echo "$data" | grep "input name=\"code\"")

    local code=${code_line:40:53}
    POST_data="${POST_data}&code=${code}"

    curl --silent --show-error --insecure --location --header "Host: $domain" --resolve $domain:443:127.0.0.1 $POST_data "$full_page_url" --cookie-jar $cookiefile --cookie $cookiefile

    if [[ $visitors_enabled == "no" ]]; then
        ynh_permission_update --permission "main" --remove "visitors"
    fi
}

#Convert --data to --data-urlencode before ynh_local_curl
myynh_urlencode() {
    local data
    if [[ $# != 1 ]]; then
        echo "Usage: $0 string-to-urlencode"
        return 1
    fi
    data="$(curl -s -o /dev/null -w %{url_effective} --get --data-urlencode "$1" "")"
    if [[ $? != 3 ]]; then
        echo "Unexpected error" 1>&2
        return 2
    fi
    echo "${data##/?}"
    return 0
}

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
