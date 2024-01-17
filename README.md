## Berachain-ERC20

Fast way to deploy an ERC20 using Foundry. To use it, pull the repo. 

Get some testnet Bera in the wallet you will deploy the contract with: https://artio.faucet.berachain.com/

Then install Foundry: https://book.getfoundry.sh/getting-started/installation

Get your Berachain private key and set it as a local environment variable by running this in your shell:
```
export PRIVATE_KEY=0x...
```

Run ```forge build``` in the root of the directory. 

Make sure you have adequate gas in your Berachain account, then run:
```
forge script script/BeraBera.s.sol:DeployBeraBera --broadcast --private-key $PRIVATE_KEY --rpc-url "https://artio.rpc.berachain.com" --chain-id 80085
```
You can check your deployment by pasting the contract address into: https://artio.beratrail.io/
