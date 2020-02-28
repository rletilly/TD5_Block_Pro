pragma solidity ^0.5.16;

contract OurICO
{
    address bigBoss;
    mapping (address => bool) public whitelist;
    constructor () public
    {
        bigBoss = msg.sender;
        whitelist[msg.sender] = true;
    }
    function update_whitelist(address _adr) public 
    {
        require(msg.sender == bigBoss);
        whitelist[_adr] = true;
    } 
    function exange_SMBT(address _adr) public payable returns(bool success)
    {
        require(whitelist[msg.sender]== true);
        
    }

}
