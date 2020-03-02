pragma solidity ^0.5.16;
import "/.ERC20.sol";

contract OurICO 
{
    address bigBoss;
    address ERC20_ad;
    address [] _recipients;
    mapping (address => bool) public whitelist;
    constructor () public
    {
        bigBoss = msg.sender;
        whitelist[msg.sender] = true;
        
        
    }
    function setERCad(address ERCad) public
    {
        require(msg.sender == bigBoss);
        ERC20_ad = ERCad;
    }
    function update_whitelist(address _adr) public  
    {
        require(msg.sender == bigBoss );
        whitelist[_adr] = true;
    } 
    
    function exange_SMBT(uint256 prix, address to) public payable returns(bool success)
    {
        require(whitelist[msg.sender]== true);
        require(msg.value == prix);
        uint prix_tok = SimpleERC20Token(ERC20_ad).setvaleur(prix);
        SimpleERC20Token(ERC20_ad).transfer(to,prix_tok);
        return true;
    }
    
    
    function update_recip(address _nrecip) public 
    {
        _recipients.push(_nrecip);
    }
    function airdrop(uint prix) public   
    {
        for(uint i = 0 ; i<_recipients.length;i++)
        {
            SimpleERC20Token(ERC20_ad).transfer(_recipients[i],prix);
        }
    }
}