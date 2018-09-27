pragma solidity ^0.4.11;
// We have to specify what version of compiler this code will compile with

contract Voting {
  /* mapping field below is equivalent to an associative array or hash.
  The key of the mapping is candidate name stored as type bytes32 and value is
  an unsigned integer to store the vote count
  */
  
  mapping (bytes32 => uint8) public votesReceived;
  
 
  bytes32[] public candidateList;                // Using an array of bytes32 instead to store the list of candidates

 
  function Voting(bytes32[] candidateNames) {    // Constructor which will be called for deploying the contract to the blockchain.
    candidateList = candidateNames;
  }

  function totalVotesFor(bytes32 candidate) returns (uint8) {       
    if (validCandidate(candidate) == false) throw;                       // This function returns the total votes
    return votesReceived[candidate];
  }

   
  function voteForCandidate(bytes32 candidate) {
    if (validCandidate(candidate) == false) throw;                // This function increments the vote count
    votesReceived[candidate] += 1;
  }

  function validCandidate(bytes32 candidate) returns (bool) {
    for(uint i = 0; i < candidateList.length; i++) {
      if (candidateList[i] == candidate) {
        return true;
      }
    }
    return false;
  }
}
