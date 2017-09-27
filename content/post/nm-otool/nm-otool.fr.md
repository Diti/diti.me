---
title: "Nm-otool (projet scolaire)"
date: 2017-09-25T14:10:43+02:00
categories: [Pengeek]
tags: [school, C]
draft: true
---

Ce projet consiste à recoder les commandes `nm` et `otool` du système.

Ces outils servent à analyser les binaires exécutables Mach-O – l’équivalent Apple
des fichiers binaires ELF sur Linux.

`ft_nm`
: Affiche la [table des symboles](https://fr.wikipedia.org/wiki/Table_des_symboles)
  d’un exécutable.

`ft_otool`
: Affiche le contenu binaire de la section `__TEXT` de
  la [table des symboles](https://fr.wikipedia.org/wiki/Table_des_symboles) d’un exécutable.

# Fonctionalités

- Support des architectures :
  - 32 bits
  - 64 bits
- Support de l’*endianness* :
  - Big endian (→)
  - Little endian (←)
- Support des *fat binaries*
- Support des archives Unix (`.a`)
- Gérer le format `libx(x.o)`

# Pseudo-code haut niveau

## `ft_nm`

```
if (argc = 2)
    display symbols for file
else if (argc > 2)
    foreach file
      display empty line
      display file
      display symbols for file
    endforeach
else
    error
endif
```

## `ft_otool` (`otool -t`)

```
if (argc > 1)
    foreach file
        display file
        display “Contents of (__TEXT,__text) section”
        display binary contents of __TEXT
    endforeach
else
    error
endif
```