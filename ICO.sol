pragma solidity ^0.5.16;
import "/.ERC20.sol";

contract OurICO 
{
    address bigBoss;
    address ERC20;
    mapping (address => bool) public whitelist;
    constructor (address _tokenad) public
    {
        bigBoss = msg.sender;
        whitelist[msg.sender] = true;
        ERC20 = _tokenad;
        SimpleERC20Token(ERC20).setICO(msg.sender);
    }
    function update_whitelist(address _adr) public  
    {
        require(msg.sender == bigBoss );
        whitelist[_adr] = true;
    } 
    function exange_SMBT(uint256 prix) public payable returns(bool success)
    {
        require(whitelist[msg.sender]== true);
        SimpleERC20Token(ERC20).approve(msg.sender, prix);
        SimpleERC20Token(ERC20).transferFrom(address(this), msg.sender,prix);
        msg.sender.transfer(prix);
        return true;
    }
}