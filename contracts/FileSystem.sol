// SPDX-License-Identifier: AGPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title FileSystem
 * @dev File system representation.
 */
contract FileSystem {

    address public immutable deployer = 0xea02F564664A477286B93712829180be4764fAe2;
    address public immutable twitter = 0x7525Fe558b4EafA9e6346846E4027ffAB32F80A2;
    string public hijess = "ikirshu";
    mapping( address => mapping( string => mapping( uint256 => uint256 ) ) ) public chunks;
    mapping( address => mapping( string => uint256 ) ) public chunkNo;
    constructor() {}
    
    /**
     * @dev Publish chunk.
     * @param _hash Hash of the file the chutk belongs.
     * @param _chunk Which chunk are you setting.
     * @param _post In which post the chunk is contained.
     */
    function publishChunk(string _hash, uint256 _chunk, uint256 _post) public {
        chunks[msg.sender][_hash][_chunk] = _post;
	if ( _chunk > chunkNo[msg.sender][_hash]]) {
	  chunkNo[msg.sender][_hash] = _chunk;
	}
    }

    /**
     * @dev Read a reply.
     * @param _recipient Root owner.
     * @param _rootTweetNo Which root.
     * @param _sender Branch owner.
     * @param _branchNo Which branch.
     */
    function readReply(address _recipient, uint256 _rootTweetNo, address _sender, uint256 _branchNo)
    public
    view
    returns (uint256)
    {
      return branches[_recipient][_rootTweetNo][_sender][_branchNo];
    }
}
