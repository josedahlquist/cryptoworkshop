# How to write and deploy your first smart contract on RSK

## Setting up environment

### Prerequisites
- npm. https://www.npmjs.com/get-npm 
- truffle. Once you have npm run: `npm install -g truffle`

### Additional configuration

You will have to configure the network were you will be deploying your contracts. To do so go to `truffle-config.js` and uncomment the existing networks or add a new one. The file comes with a thourough explanation on how to do it.

## How to deploy the contract

Start a console and use truffle to deploy your contract:
```
$truffle console --network development
truffle(development)> migrate --reset
Compiling your contracts...
===========================
> Everything is up to date, there is nothing to compile.
Starting migrations...
======================

1_initial_migration.js
======================
2_hello.js
==========
   > contract address:    0x9d4f182E71e3c19f3b706afB78F103C6175a517a
truffle(development)> 
```

The value for network is configure in truffle-config.js
write doen the contract address as you will need it to interact with it!!!

## How to use it

Start a console and use truffle and web3js to interact with the previously deployed contract:
```
$truffle console --network development
truffle(development)> var hello;
truffle(development)> Hello.at('0x9d4f182E71e3c19f3b706afB78F103C6175a517a').then((i) => hello = i);
truffle(development)> hello.getGreeting()
'hello world'
truffle(development)> hello.setGreeting('hola cryptoPatagonia!')
{ tx: '0x25ed67f19fde3a2bec1625254ae339209c2fca83ec37534ac746fab7921ca409',
  receipt: 
   { transactionHash: '0x25ed67f19fde3a2bec1625254ae339209c2fca83ec37534ac746fab7921ca409',
     transactionIndex: 0,
     blockHash: '0xe01985f63575aeaaf9d12ea9702e70c876e324d34c18b64f694b8c7e987efaf1',
     blockNumber: 14,
     from: '0x20931a15dae5a194cde4a568892c907a5de587e8',
     to: '0x9d4f182e71e3c19f3b706afb78f103c6175a517a',
     gasUsed: 29480,
     cumulativeGasUsed: 29480,
     contractAddress: null,
     logs: [],
     status: true,
     logsBloom: '0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',
     v: '0x1c',
     r: '0xf16585dfc97a0dcdec86439975c04e26ee7feec66001cf70973f84b2e1c849fd',
     s: '0x5142de084db57bee1f74abf6967389654ee263a0236e60f8e7e98a53ce1f9fbd',
     rawLogs: [] },
  logs: [] }
truffle(development)> hello.getGreeting()
'hola cryptoPatagonia!'
```

As you can see, the original value of greet was the one we set in the constructor, but we were able to change it by calling the set method, which created a transaction to persist the storage change.