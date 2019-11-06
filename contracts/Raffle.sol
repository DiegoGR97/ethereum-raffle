pragma solidity ^0.5.8;
//import  "https://github.com/ethereum/dapp-bin/blob/master/library/stringUtils.sol";

contract Raffle {
    struct raffleCreator {
        uint id;
        address publicKey;
        string privateKey;
    }
    struct Competitor {
        uint id;
        address publicKey;
        uint ticketNumber;
    }
    struct Ticket{
        uint id;
        uint ticketNumber;
    }
    uint public competitorsCount;
    uint public ticketsCount;
    uint winnerCompetitor;
    //address creatorPrivateKey = 415735b1fd4ca68e3f6d9cd36844fb61d560364a4c1f0d2ded23867165fba1ce;
    mapping(uint => raffleCreator) public rafflecreator;
    mapping(uint => Competitor) public competitors;
    mapping(uint => Ticket) public tickets;

    constructor() public {
        addRaffleCreator(1, 0x3D4921D9c0C9C07914E4F7006012d7E8CE1c5836, '415735b1fd4ca68e3f6d9cd36844fb61d560364a4c1f0d2ded23867165fba1ce');
        generateTicket('415735b1fd4ca68e3f6d9cd36844fb61d560364a4c1f0d2ded23867165fba1ce');
    }

    function addRaffleCreator (
    uint id,
    address publicKey,
    string memory _privateKey) private {
    rafflecreator[1] = raffleCreator(id, publicKey, _privateKey);
    }

    function generateTicket (
    string memory _privateKey) public {
        string memory privateKeyCreator = rafflecreator[1].privateKey;
        if (compareStrings(_privateKey,privateKeyCreator)){
            ticketsCount++;
            tickets[ticketsCount] = Ticket(ticketsCount, ticketsCount);
        }
    }
    function compareStrings (string memory a, string memory b) public view returns (bool) {
    return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))) );
       }
        
}