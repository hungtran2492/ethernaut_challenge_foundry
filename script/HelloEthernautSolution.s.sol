//SPDX-Licesnse-Identifier: MIT

pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {HelloEthernaut} from "../src/HelloEthernaut.sol";

contract HelloEthernautSolution is Script {

  HelloEthernaut helloEthernaut = HelloEthernaut(0x6C9e988584A57070bDA624c16481114cf83875Eb);

  function run() external {
     string memory password = helloEthernaut.password();
    console.log("Password: ", helloEthernaut.password());
    vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
    helloEthernaut.authenticate(password);
    vm.stopBroadcast();
  }

}