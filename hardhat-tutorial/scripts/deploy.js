const { ethers } = require("hardhat");

//스마트컨트렉트를 블록체인 상에 배포할때 실행될 메인 함수
async function main(){
  const whitelistContract = await ethers.getContractFactory("Whitelist");

  const deployedWhitelistContract = await whitelistContract.deploy(10);

  await deployedWhitelistContract.deployed();

  console.log("Whitelist Contract address:", deployedWhitelistContract.address);
}

main()
  .then(() => process.exit(0))
  .catch((error)=>{
    console.error(error);
    process.exit(1);
  })