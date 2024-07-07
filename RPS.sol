// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Main{


    address owner;

    /** 
    * @dev Contains all types of possible steps
    * @param Rock
    * @param Paper
    * @param Scissors 
    */
    enum Option{
        Rock,
        Paper,
        Scissors
    }


    /** 
    * @dev This type will be included in list of all games
    * @param makePlayer Address of player who made the game
    * @param joinPlayer Address of player who joined the game
    * @param OptionMP Option of player who made the game
    * @param OptionJP Option of player who made the game
    */
    struct Game{
        address makePlayer;
        address joinPlayer;
        Option OptionMP;
        Option OptionJP;
        address winner;        
    }

    Game[] games;
    
    constructor(){
        owner = msg.sender;
    }

    function createGame(uint _step) public{
        Game game(makePlayer: msg.sender,,OptionMP: _step,,);
    }
}