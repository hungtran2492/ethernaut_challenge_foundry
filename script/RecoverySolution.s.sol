//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
//Solution: The way to re-build the address of a created contract is to get the rightmost 160 bits of 
//the keccak-256 hash of the RLP encoding of sender + sender's nonce.
//What is RLP encoding? And what is the sender's nonce? How to find it?
//The nonce is the number of contract that the contract itself has created.
// An important thing to remember: contract's nonce starts from 1 and not 0!
//address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xd6), bytes1(0x94), _origin, bytes1(0x01))))));

import {Script,console} from "forge-std/Script.sol";
import {Recovery} from "../src/Recovery.sol";

contract RecoveryAttack {
  
  function addressFrom(address _origin, uint _nonce) public pure returns (address _address) {
    bytes memory data;
    if(_nonce == 0x00)          data = abi.encodePacked(bytes1(0xd6), bytes1(0x94), _origin, bytes1(0x80));
    else if(_nonce <= 0x7f)     data = abi.encodePacked(bytes1(0xd6), bytes1(0x94), _origin, uint8(_nonce));
    else if(_nonce <= 0xff)     data = abi.encodePacked(bytes1(0xd7), bytes1(0x94), _origin, bytes1(0x81), uint8(_nonce));
    else if(_nonce <= 0xffff)   data = abi.encodePacked(bytes1(0xd8), bytes1(0x94), _origin, bytes1(0x82), uint16(_nonce));
    else if(_nonce <= 0xffffff) data = abi.encodePacked(bytes1(0xd9), bytes1(0x94), _origin, bytes1(0x83), uint24(_nonce));
    else                        data = abi.encodePacked(bytes1(0xda), bytes1(0x94), _origin, bytes1(0x84), uint32(_nonce));
    bytes32 hash = keccak256(data);
    assembly {
        mstore(0, hash)
        _address := mload(0)
    }
}

  function destroy() external  {
  address lostContract = addressFrom(address(0xcc7afFA6a111375D0736391B4DAc230E00ae031A),0xffffff);
  console.log(lostContract.balance);
  // lostContract.destroy(payable(address(this)));

  }

  receive() external payable {}
}
contract RecoverySolution is Script {
  function run() external {
    vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
  RecoveryAttack recoveryAttackInstance = new RecoveryAttack();
  recoveryAttackInstance.destroy();
    vm.stopBroadcast();
  }
}