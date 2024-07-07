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
        uint bid;
        address joinPlayer;
        Option OptionMP;
        Option OptionJP;
        address winner;        
    }

    Game[] games;
    
    constructor(){
        owner = msg.sender;
    }

    function createGame(uint _step) public payable{
        Game memory newGame = Game({
            makePlayer: msg.sender,
            bid: msg.value,
            joinPlayer: address(0),
            OptionMP: Option(_step),
            OptionJP: Option(0),
            winner: address(0)
            });
        
        games.push(newGame);
    }

    function joinGame(uint gameId, uint _step) public payable{
        require(msg.value >= games[gameId].bid, "Your bid is too small");
        games[gameId].joinPlayer = msg.sender;
        games[gameId].OptionJP = Option(_step);
        games[gameId].winner = playGame(gameId, games[gameId].makePlayer ,games[gameId].joinPlayer);
    }

    function playGame(uint gameId, address makePlayer, address joinPlayer) private returns (address){
        Option make = games[gameId].OptionMP;
        Option join = games[gameId].OptionJP;

        return address(0);
    }

    function getGame(uint Id) public view returns (Game memory){
        return games[Id];
    }
}