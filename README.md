# TD5_Block_Pro

Question 1: Welcome to our repo, the teacher has been invited as a collaborator.

Question 2: We've intalled the truffle suite and we are currently in version V5.1.15

Question 3: In the commits, we've chosen our ERC20 template with "SMBT" as our ticker, a totalsupply of : 1000000 * (10^18) and 18 decimals.

Question 4: There are the 3 mandatory functions in our SimpleERC20Token contract : "function transfer(address to, uint256 value) public returns (bool success)"
"function approve(address spender, uint256 value)"
"function transferFrom(address from, address to, uint256 value)"
We also have totalsupply, a limited number of tokens and allowance, a mapping that register the value given by a contributor.

Question 5: To efficiently deploy our contract in truffle using ganache, there were five things to do:

Modify the truffle-config file : uncomment the part where ganache is disabled and change the "port" name.

Add in the "contracts" folder our two smart contracts (ICO, ERC20)

Modify in the "migrations" folder the "initial_migration" file with the deployement command for our contracts.

Add in "build/contracts" the Json file of our contracts

Then in our command promt, write "truffle develop ganache" and "truffle migrate" if the command "truffle init" has already been written.
We sucessfuly did it but used mycrypto and remix for later use.

Question 6: The white listing implementation is in our ICO contract. At first, as we choose to have 10% of the total supply, we set ourselves in the whitelist. Then in "function update_whitelist(address adr) public" a function only the creator can call, we add one by one the adresses that are interested in investing on our tokens.
The white list is then created.

Question 7: In order to reward the first investors, we attribute according to the amount left in the contract balance, a fair amount of tokens.
reward : prix_init x ((balanceOf[icoAdress] x 10)/totalSupply)
With that use, the first contributor that gives us 10 eth recieve 9x10 SMBT
If the balanceOF[icoAdress] is at 50% of its original value 10 eth are worth 5x10 SMBT
The functions used are : 
function setvaleur(uint prix_init)view public returns(uint recompense)
function exange_SMBT(uint256 prix, address to) public payable returns(bool success)

Question 8: An airdrop function is the possibility of giving SMBT to several adresses at the same time. In order to do so, we need an array of adresses incremented by our user (function update_recip(address nrecip) public).
Then we iterate through the list and call transfer function with a given price for all.

Question 9: For the most part of the project we used remix wich is a solidity debugger and we runned it on ropsten with Web3 injected.
That way, our project is already running on a testnet.
To credit tokens to the teacher adress, we simply added it to our recipens array and use the function air drop.
