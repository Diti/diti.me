---
title: Développez pour Android
language: fr
authors:
  - Cyril Mottier
  - Ludovic Perrier
rating: 4 # /5
description: >-
  Un livre sur Android 2 par Cyril Mottier, acheté en novembre 2011, qui parle
  de l’optimisation de ses applications Android. 
date: 2011-11-26
format: Kindle
link: https://cyrilmottier.com/2011/03/14/developpez-pour-android-enfin-disponible/
tags:
  - Android
  - dev
---

Écrit par [Cyril Mottier](http://cyrilmottier.com), ce livre, rendu
partiellement obsolète depuis la sortie d’Android 4, discutait de thèmes
intéressants liés à l’optimisation.

# Citations

## Emplacement 1182
> Par exemple, `Intent.FLAG_ACTIVITY_CLEAR_TOP` permet de remettre la pile
  de l’historique des activités à zéro. L’activité lancée par l’intention devient
  alors l’activité du plus haut niveau, un retour en arrière entraîne donc un retour
  à l’application précédente.

## Emplacement 1315
> Il peut être raisonnable de prévoir le cas où la résolution échoue au lancement
  de certaines intentions, typiquement dans le cas d’une intention destinée à
  l’Android Market. Celui-ci n’étant pas installé sur tous les périphériques Android,
  il faut prévoir ce cas.

## Emplacement 2078
> La version d’Android 1.6 introduit un attribut XML particulièrement utile :
  `android:onClick`. Cet attribut prend une chaîne de caractères représentant le
  nom de la méthode de l’activité à appeler. Ainsi un clic sur une vue V portant
  l’attribut `android:onClick="handleClick"` exécutera la méthode `public void
  handleClick(View v)` (où v équivaut à V) de l’activité affichant la vue V. Cet
  attribut évite au développeur les opérations rébarbatives permettant d’assigner
  un listener à une vue.