// Raffle
// Enter the lottery (paying some amount)
// Pick a random winner (verifiably random)
// Winner to be selected every X minutes -> completely automated
// Chainlink Oracle -> Randomness, Automated Execution (Chainlink Keepers)

// SPDXX-License-Identifier: MIT
pragma solidity ^0.8.8;

Raffle__NotEnoughETHEntered();

contract Raffle {
    /** State Variables */
    uint256 private immutable i_entranceFee;
    address payable[] private s_players;

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterRaffle() public payable {
        // this is not optimal as you have to store string message and add additional gas costs!
        // require(msg.value > i_entranceFee, "Not enough ETH!");
        if(msg.value < i_entranceFee) {
            revert Raffle__NotEnoughETHEntered();
        }
        s_players.push(payable(msg.sender));
        // Emit and event when we update a dynamic array or mapping
        
    }

    function entranceFee() public view returns (uint256) {
        return i_entranceFee;
    }

    function getPlayer(uint256 index) public view returns (address) {
        return s_players[index];
    }
}
