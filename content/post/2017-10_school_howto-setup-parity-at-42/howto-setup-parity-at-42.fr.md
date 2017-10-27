---
title: "Comment mettre en place Parity à 42"
date: 2017-10-27T18:20:40+02:00
categories: [Pengeek]
tags:
  - ethereum
  - howto
  - parity
  - ecole
aliases: ["/fr/post/how-to-setup-parity-at-42/"]
---

Cet article est un howto rapide sur comment mettre en place un node Ethereum sur
nos sessions macOS à l’école, de taille très limitée.

# Instructions d’installation

1. Conformément aux [instructions officielles](https://github.com/paritytech/homebrew-paritytech/blob/master/README.md),
commencez par installer Parity avec Homebrew :

    ``` sh
    brew tap paritytech/paritytech
    brew install parity
    ```

2. Modifiez (ou créez) `~/Library/Application\ Support/io.parity.ethereum/config.toml`:

    ``` toml
    [parity]
    chain = "ropsten"
    base_path = "/goinfre/io.parity.ethereum"

    [footprint]
    db_compaction = "hdd"
    ```

3. Assurez-vous que le dossier sus-cité, que va utiliser Parity pour ses données, existe :

    ``` sh
    mkdir /goinfre/io.parity.ethereum
    ```

4. Ajoutez Parity à `brew services`:

    ``` sh
    brew services start paritytech/paritytech/parity
    ```

# Informations additionnelles

- Utilisez Parity dans le navigateur en visitant [127.0.0.1:8180](http://127.0.0.1:8180).
- Les frameworks comme [Embark](https://github.com/iurimatias/embark-framework) or
  [Truffle](https://github.com/trufflesuite/truffle) communiquent avec la blockchain
  par le biais d’un protocole appelé JSON-RPC.
- L’ajout de Parity à `brew services` lui permettra de se lancer au démarrage,
  de se synchroniser à la blockchain Ropsten par défaut (conformément à notre fichier
  de config), et de fournir une [interface JSON-RPC](https://github.com/paritytech/parity/wiki/JSONRPC)
  sur le port 8545.
- Dans votre navigateur, vous pouvez demander à [MetaMask](https://metamask.io/) d’utiliser
  n’importe quelle blockchain sur laquelle Parity est synchronisée (cf. [vos préférences](http://127.0.0.1:8180/#/settings/parity))
  en choisissant « Localhost 8545 ».
