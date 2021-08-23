pragma solidity ^0.8.0;

contract redpacket {
	address payable public richer;
	uint public number;

	constructor(uint _number) payable public {
	    richer = msg.sender;
	    number = _number;
	}

	function getBalance() public view returns (uint) {
	    return address(this).balance;
	}
	
	function stakeMoney() public payable returns (bool) {
		require(number > 0);
		require(getBalance() > 0);
		number --;

		uint random = uint(keccak256(abi.encode(now,msg.sender,"richer"))) % 100;
		uint balance = getBalance();
		msg.sender.transfer(balance * random / 100);
		return true;
	}

	function kill() public {
	    require(msg.sender == richer);
	    selfdestruct(richer);
	}

}


