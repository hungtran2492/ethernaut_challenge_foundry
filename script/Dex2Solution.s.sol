//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script,console} from "forge-std/Script/sol";
import {DexTwo} from "../src/Dex2.sol";

contract Dex2Solution is Script {

    function run() {
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

      vm.stopBroadcast();
    }
}