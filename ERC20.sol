pragma solidity ^0.5.16;

contract SimpleERC20Token {
    // Track how many tokens are owned by each address.
    mapping (address => uint256) public balanceOf;

    // Modify this section
    string public name = "SUPER MARVELOUS BEST TOKEN";
    string public symbol = "SMBT";
    uint8 public decimals = 18;
    uint256 public totalSupply = 1000000 * (uint256(10) ** decimals);
    address icoAdress;
    address bigBoss;

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor() public {
        // Initially assign all tokens to the contract's creator.
        balanceOf[msg.sender] = (10*totalSupply)/100;
        bigBoss = msg.sender;
        emit Transfer(address(0), msg.sender, totalSupply/10);
    }
    
    function transfer(address to, uint256 value) public returns (bool success) {
        require(balanceOf[msg.sender] >= value);

        balanceOf[msg.sender] -= value;  // deduct from sender's balance
        balanceOf[to] += value;          // add to recipient's balance
        emit Transfer(msg.sender, to, value);
        return true;
    }

    event Approval(address indexed owner, address indexed spender, uint256 value);

    mapping(address => mapping(address => uint256)) public allowance;


    function approve(address spender, uint256 value)
        public
        returns (bool success)
    {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }
    //fonction qui ne peut être appelée que part le créateur du contrat pour donner sa balance a l'ico 
    function setICO(address ICO) public returns(bool success){
        require (msg.sender == bigBoss);
        icoAdress = ICO;
        balanceOf[icoAdress] = (90*totalSupply)/100;
        emit Transfer(address(0), ICO, (90*totalSupply)/100);
        return true;
    }
    
    function getbal(address from) view public returns (uint bal)
    {
        return balanceOf[from];
    }
    function transferFrom(address from, address to, uint256 value)
        public
        returns (bool success)
    {
        require(value <= balanceOf[from]);
        require(value <= allowance[from][msg.sender]);

        balanceOf[from] -= value;
        balanceOf[to] += value;
        allowance[from][msg.sender] -= value;
        emit Transfer(from, to, value);
        return true;
    }
    function setvaleur(uint prix_init)view public returns(uint recompense)
    {
        return(prix_init * ((balanceOf[icoAdress]*10)/totalSupply));
    }
}