# Question2Answer pour YunoHost

[![Niveau d'intégration](https://dash.yunohost.org/integration/question2answer.svg)](https://dash.yunohost.org/appci/app/question2answer) ![](https://ci-apps.yunohost.org/ci/badges/question2answer.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/question2answer.maintain.svg)  
[![Installer question2answer avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=question2answer)

*[Read this readme in english.](./README.md)* 

> *Ce package vous permet d'installer Question2Answer rapidement et simplement sur un serveur YunoHost.  
Si vous n'avez pas YunoHost, consultez [le guide](https://yunohost.org/#/install) pour apprendre comment l'installer.*

## Vue d'ensemble
Question2Answer (Q2A) est une plateforme de Questions/Réponses pour PHP/MySQL.

**Version incluse :** 1.8.5

## Captures d'écran

![](./images/install_screenshot)

## Démo

* [Démo officielle](http://demo.question2answer.org/)

## Configuration

Cette application se configure via son interface administrateur, accessible sur `https://mondomaine/monquestion2answer/index.php/admin/`

## Documentation

 * Documentation officielle : https://www.question2answer.org/
 * Documentation YunoHost : Si une documentation spécifique est nécessaire, n'hésitez pas à contribuer.

## Caractéristiques spécifiques YunoHost

#### Support multi-utilisateur

Cette application supporte le multiutilisateur, mais n'est pas intégrée avec le LDAP ni le SSO.
Les pages d'administration sont protégées par SSOwat.

#### Architectures supportées

* x86-64 - [![Build Status](https://ci-apps.yunohost.org/ci/logs/question2answer%20%28Apps%29.svg)](https://ci-apps.yunohost.org/ci/apps/question2answer/)
* ARMv8-A - [![Build Status](https://ci-apps-arm.yunohost.org/ci/logs/question2answer%20%28Apps%29.svg)](https://ci-apps-arm.yunohost.org/ci/apps/question2answer/)

## Limitations

* Pas de limitations connues.

## Informations additionnelles

**Plus d'informations sur la page de documentation :**  
https://yunohost.org/packaging_apps

## Liens

 * Signaler un bug : https://github.com/nils-van-zuijlen/question2answer_ynh/issues
 * Site de l'application : https://www.question2answer.org
 * Dépôt de l'application principale : https://github.com/q2a/question2answer
 * Site web YunoHost : https://yunohost.org/

---

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche testing](https://github.com/YunoHost-Apps/question2answer_ynh/tree/testing).

Pour essayer la branche testing, procédez comme suit.
```
sudo yunohost app install https://github.com/YunoHost-Apps/question2answer_ynh/tree/testing --debug
ou
sudo yunohost app upgrade question2answer -u https://github.com/YunoHost-Apps/question2answer_ynh/tree/testing --debug
```
