// SPDX-License-Identifier: CC0-1.0
pragma solidity ^0.8.6;

import "@openzeppelin/contracts/utils/introspection/ERC165.sol";
import {IERC721Metadata} from "./IERC721Metadata.sol";
import {IERC4973} from "./IERC4973.sol";


abstract contract ERC4973 is ERC165, IERC721Metadata, IERC4973 {
  string private _name;
  string private _symbol;
  string private _issuing_person ;

  struct Info 
  {
    string name ;
    string category ;
    uint256 rank ;
  }

  mapping(uint256 => address) private _owners;
  mapping(uint256 => Info) private _tokenURIs;

  constructor(
  
  ) {
    _name = WEB3NestMetaverse;
    _symbol = web3_NeMe;
    _issuing_person = "Aditya soni" ;
  }
  Info info ;

//   function supportsInterface(bytes4 interfaceId) public view override returns (bool) {
//     return
//       interfaceId == type(IERC721Metadata).interfaceId ||
//       interfaceId == type(IERC4973).interfaceId ||
//       super.supportsInterface(interfaceId);     //super is used to call the original implementaiton of the function from the parent contract
//   }

  function name() public view virtual override returns (string memory) {
    return _name;
  }

  function symbol() public view virtual override returns (string memory) {
    return _symbol;
  }

  function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
    require(_exists(tokenId), "tokenURI: token doesn't exist");
    return _tokenURIs[tokenId];
  }
  
  //whether the certificate (tokenid ) exists 
  function _exists(uint256 tokenId) internal view virtual returns (bool) {
    return _owners[tokenId] != address(0);
  }
 
  //owner if the certificate
  
  function ownerOf(uint256 tokenId) public view virtual returns (address) {
    address owner = _owners[tokenId];
    require(owner != address(0), "ownerOf: token doesn't exist");
    return owner;
  }
   
    //function to mint the tokens 

  function _mint(
    address to,
    uint256 tokenId,
    string _name , string _category , uint256 _rank 
  ) internal virtual returns (uint256) {
    require(!_exists(tokenId), "mint: tokenID exists");
    _owners[tokenId] = to;
    _tokenURIs[tokenId] = Info(_name , _category , _rank ) ;
     emit Attest(to, tokenId);
    return tokenId;
  }

  function _burn(uint256 tokenId) internal virtual {
    address owner = ownerOf(tokenId);

    delete _owners[tokenId];
    delete _tokenURIs[tokenId];

     emit Revoke(owner, tokenId);

  }
}