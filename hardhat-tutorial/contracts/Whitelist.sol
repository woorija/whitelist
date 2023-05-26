// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Whitelist{
    //화리 최대허용 수
    uint8 public maxWhitelistAddresses; 
    // 화리 등록된 지갑주소s (등록주소 = T) 
    mapping(address => bool) public whitelistedAddresses; 
    //실제 화리 등록한 지갑 수
    uint8 public numAddressesWhitelisted; 

    // 화리 컨트랙트실행시 함께 실행되는 생성자 함수
    constructor(uint8 _maxwhitelistAddresses){ 
        maxWhitelistAddresses = _maxwhitelistAddresses;
    }

    //화리에 지갑주소 등록시켜주는 함수
    function addAddressToWhitelist() public { 
        //특정 지갑이 화리에 등록이 되어있는지 검증
        require(!whitelistedAddresses[msg.sender], "You are already on the whitelist");
        //허용가능한 최대인원수보다 많은 인원이 화리에 등록하려할 때
        require(numAddressesWhitelisted < maxWhitelistAddresses, "More addresses cant be added, limit reached");
        //화리 등록할 주소를 맵에 추가 키 : 주소 값 : true
        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }
}