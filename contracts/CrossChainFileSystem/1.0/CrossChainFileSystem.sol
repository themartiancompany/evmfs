// SPDX-License-Identifier: AGPL-3.0

//    ----------------------------------------------------------------------
//    Copyright © 2025  Pellegrino Prevete
//
//    All rights reserved
//    ----------------------------------------------------------------------
//
//    This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU Affero General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU Affero General Public License for more details.
//
//    You should have received a copy of the GNU Affero General Public License
//    along with this program.  If not, see <https://www.gnu.org/licenses/>.


pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Cross Chain File System
 * @dev Ethereum Virtual Machine File System
 *      extension designed to split files
 *      across many Ethereum Virtual Machine
 *      blockchains at once.
 */
contract CrossChainFileSystem {

    address public immutable deployer = 0x87003Bd6C074C713783df04f36517451fF34CBEf;
    string public hijess = "neverstopkissingme";
    string public version = "1.0";

    mapping(
      address => mapping(
        string => mapping(
          uint256 => mapping(
            uint256 => mapping(
              uint256 => address ) ) ) ) ) public chunks;
    mapping(
      address => mapping(
        string => mapping(
          uint256 => uint256 ) ) ) public chunksNo;

    constructor() {}

    /**
     * @dev Check owner.
     * @param _namespace Address owning the hash.
     */
    function checkOwner(
      address _namespace)
      public
      view {
      require(
        msg.sender == _namespace
      );
    }

    /**
     * @dev Publish cross-chain chunk.
     * @param _namespace Namespace for the file definition.
     * @param _hash Hash of the file the chunk belongs.
     * @param _index Which chunk are you setting.
     * @param _chainId Chain ID on which the chunk is published.
     * @param _fileSystem Address of the FileSystem contract
     *                    on the selected blockchain.
     */
    function publishCrossChainChunk(
      address _namespace,
      string memory _hash,
      uint256 _index,
      uint256 _chainId,
      address _fileSystem) public {
      checkOwner(
        _namespace);
      uint256 _currentChunk =
        chunksNo[
          _namespace][
            _hash][
              _index];
      chunks[
        _namespace][
          _hash][
            _index][
              _currentChunk][
                _chainId] =
        _fileSystem;
      chunksNo[
        _namespace][
          _hash][
            _index] =
        _currentChunk + 1;
    }

}
