// SPDX-License-Identifier: AGPL-3.0

/**    ----------------------------------------------------------------------
 *     Copyright ©
 *       Pellegrino Prevete
 *         2025, 2026
 * 
 *     All rights reserved
 *     ----------------------------------------------------------------------
 * 
 *     This program is free software: you can redistribute it and/or modify
 *     it under the terms of the GNU General Public License as published by
 *     the Free Software Foundation, either version 3 of the License, or
 *     (at your option) any later version.
 * 
 *     This program is distributed in the hope that it will be useful,
 *     but WITHOUT ANY WARRANTY; without even the implied warranty of
 *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *     GNU General Public License for more details.
 * 
 *     You should have received a copy of the GNU General Public License
 *     along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

pragma solidity >=0.7.0 <0.9.0;

interface FileSystemInterface { 
  function publish(
    address _namespace,
    string memory _hash,
    uint256 _index,
    string memory _chunk)
    external;

  function lock(
    address _namespace,
    string memory _hash,
    uint256 _index)
    external;
}

/**
 * @title BulkOps
 * @dev Miscellanous Bulk File System Operations.
 */
contract BulkOps {

    address public immutable deployer = 0xea02F564664A477286B93712829180be4764fAe2;
    address public immutable twitter = 0x7525Fe558b4EafA9e6346846E4027ffAB32F80A2;
    string public _name = "Bulk Ops";
    constructor() {}

    /**
     * @dev Returns the name of the contract.
     */
    function name(
      ) public view virtual returns (string memory) {
      return _name;
    }
    
    /**
     * @dev Publish chunks in bulk.
     * @param _fs File System deployment address.
     * @param _namespace Namespace for the file definition.
     * @param _hash Hash of the file the chunks belongs.
     * @param _index Which chunks are you setting.
     * @param _chunks Chunks to set.
     */
    function publishBulk(
      address _fs,
      address _namespace,
      string memory _hash,
      uint256 _index,
      string[] calldata _chunks) public {
      FileSystemInterface _fileSystem =
        FileSystemInterface(
          _fs);
      uint256 _length =
        _chunks.length;
      for ( uint256 _chunk = 0;
            _chunk < _length;
            _chunks++) {
        uint256 _chunkIndex =
          _index + _chunk;
        _fileSystem.publish(
          _namespace,
          _hash,
          _chunkIndex,
          _chunks[
            _chunk]);
      }
    }

    /**
     * @dev Lock the chunks.
     * @param _hash Hash of the file.
     * @param _indexes Which chunks to lock.
     */
    function lockBulk(
      address _fs,
      address _namespace,
      string memory _hash,
      uint256[] calldata _indexes)
    public
    {
      FileSystemInterface _fileSystem =
        FileSystemInterface(
          _fs);
      uint256 _length =
        _indexes.length;
      for ( uint256 _index = 0;
            _index < _length;
            _index++) {
        _fileSystem.lock(
          _namespace,
          _hash,
          _index);
      }
    }

}
