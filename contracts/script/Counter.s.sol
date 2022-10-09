pragma solidity ^0.8.13;

import "forge-std/Script.sol";

contract MyScript is Script {
    function run() external {
        vm.startBroadcast();

        A nft = new A();

        vm.stopBroadcast();
    }
}

contract A {}
