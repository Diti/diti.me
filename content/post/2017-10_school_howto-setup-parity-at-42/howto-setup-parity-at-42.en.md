---
title: "How to setup Parity at 42"
date: 2017-10-27T18:20:40+02:00
categories: [Pengeek]
tags:
  - ethereum
  - howto
  - parity
  - school
---

This article is a quick how-to about setting up a local Ethereum node on our
size-constrained macOS sessions at school.

# Installation instructions

1. Following [the official instructions](https://github.com/paritytech/homebrew-paritytech/blob/master/README.md),
start off by installing Parity using Homebrew:

    ``` sh
    brew tap paritytech/paritytech
    brew install parity
    ```

2. Modify (or create) `~/Library/Application\ Support/io.parity.ethereum/config.toml`:

    ``` toml
    [parity]
    chain = "ropsten"
    base_path = "/goinfre/io.parity.ethereum"
    
    [footprint]
    db_compaction = "hdd" 
    ```

3. Make sure the aforementioned directory exists for Parity to store its contents on: 

    ``` sh
    mkdir /goinfre/io.parity.ethereum
    ```

4. Add Parity to `brew services`:

    ``` sh
    brew services start paritytech/paritytech/parity
    ```

# Additional information

- Use Parity in your browser by visiting [127.0.0.1:8180](http://127.0.0.1:8180).
- Frameworks like [Embark](https://github.com/iurimatias/embark-framework) or
  [Truffle](https://github.com/trufflesuite/truffle) communicate with the blockchain
  using a protocol called JSON-RPC.
- Managing Parity through `brew services` is convenient: it will run at startup,
  sync to the Ropsten blockchain by default (following our config file), and provide
  a [JSON-RPC interface](https://github.com/paritytech/parity/wiki/JSONRPC)
  on port 8545.
- In your browser, you can ask [MetaMask](https://metamask.io/) to use whichever
  blockchain Parity is running (per [your settings](http://127.0.0.1:8180/#/settings/parity))
  by selecting “Localhost 8545”.
