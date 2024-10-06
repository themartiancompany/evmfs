/**
 *Submitted for verification at gnosisscan.io on 2024-07-13
*/

// SPDX-License-Identifier: AGPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title FilemSystem
 * @dev File system representation.
 */
contract FileSystem {

    address public immutable deployer = 0xea02F564664A477286B93712829180be4764fAe2;
    address public immutable twitter = 0x7525Fe558b4EafA9e6346846E4027ffAB32F80A2;
    string public hijess = "ikirshu";
    mapping( address => mapping( string => bool ) ) public lock;
    mapping( address => mapping( string => mapping( uint256 => string ) ) ) public chunks;
    mapping( address => mapping( string => uint256 ) ) public length;
    constructor() {}
    
    /**
     * @dev Publish chunk.
     * @param _hash Hash of the file the chunk belongs.
     * @param _chunk Which chunk are you setting.
     * @param _post In which post the chunk is contained.
     */
    function publishChunk(string _hash, uint256 _index, string _chunk) public {
	require( lock[msg.sender][_hash] != true );
        chunks[msg.sender][_hash][_index] = _chunk;
	if ( _index > length[msg.sender][_hash]]) {
	  length[msg.sender][_hash] = _index;
	}
    }

    /**
     * @dev Lock the chunk.
     * @param _hash Hash of the file.
     * @param _index Which chunk to lock.
     */
    function lockChunk(string _hash, uint256 _index, address _sender, uint256 _branchNo)
    public
    {
      require( lock[msg.sender][_hash] != true );
      lock[msg.sender][_hash][_index] = true;
    }
}

    /**
     * @dev Read a chunk.
     * @param _namespace Where the filo resides.
     * @param _hash Hash of the file.
     * @param _index Which chunk.
     */
    function readChunk(address _namespace, string _hash, uint256 _index)
    public
    view
    returns (string)
    {
      return chunks[_namespace][_hash][_index];
    }
}
