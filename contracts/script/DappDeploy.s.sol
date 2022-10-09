pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/CoreContract.sol";
import "../src/FakeWorldCoin.sol";

contract MyScript is Script {
    function run() external {
        vm.startBroadcast();

        FakeWorldCoin fakeWorldCoin = new FakeWorldCoin();

        fakeWorldCoin.secureMint(
            0x3A86bBEbbba82C169136A7B5Da9304021D3aa076,
            "A"
        );

        fakeWorldCoin.secureMint(
            0xE048B980e626708E601bd8Dc8f36448820224D65,
            "B"
        );

        fakeWorldCoin.secureMint(
            0xff39c13f0E1F38E94d959F003Aac0B80D6073F42,
            "C"
        );

        fakeWorldCoin.secureMint(
            0x52C1B1DdbD44e3376a734b35c36466Ba73af3D0C,
            "D"
        );

        address[] memory allowed = new address[](4);
        allowed[0] = 0xff39c13f0E1F38E94d959F003Aac0B80D6073F42;
        allowed[1] = 0x52C1B1DdbD44e3376a734b35c36466Ba73af3D0C;
        allowed[2] = 0x3A86bBEbbba82C169136A7B5Da9304021D3aa076;
        allowed[3] = 0xE048B980e626708E601bd8Dc8f36448820224D65;

        CoreContract coreContract = new CoreContract(
            allowed,
            2,
            address(fakeWorldCoin)
        );
        coreContract.addNewCountry("arg", 2);
        coreContract.addNewCountry("br", 2);
        coreContract.addNewCountry("col", 2);

        vm.stopBroadcast();
        console.log("FakeWorldCoin : ", address(fakeWorldCoin));
        console.log("CoreContract : ", address(coreContract));
    }
}
