// SPDX-License-Identifier: AGPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title LengthLock
 * @dev Locks File System 1.0 file length.
 */
contract LengthLock {

    address public immutable deployer = 0xea02F564664A477286B93712829180be4764fAe2;
    address public immutable twitter = 0x7525Fe558b4EafA9e6346846E4027ffAB32F80A2;
    string public hijess = "tiamo";
    string public _name = "Length Lock";
    mapping( address => mapping(address => mapping( string => bool) ) ) public lock;
    mapping( address => mapping(address => mapping( string => uint256 ) ) ) public length;
    constructor() {}

    /**
     * @dev Returns the name of the contract.
     */
    function name(
      ) public view virtual returns (string memory) {
      return _name;
    }
    
    /**
     * @dev Check owner.
     * @param _namespace Address owning the hash.
     */
    function checkOwner(
      address _namespace)
      public
      view {
      require( msg.sender == _namespace );
    }

    /**
     * @dev Returns total chunks for a file.
     * @param _filesystem File system 1.0 address.
     * @param _namespace Address owning the hash.
     * @param _hash Hash of the file the chunk belongs.
     * @param _length Length of the file.
     */
    function setLength(
      address _filesystem,
      address _namespace,
      string memory _hash,
      uint256 _length) public {
      checkOwner(
        _namespace);
      checkLengthUnlocked(
	_filesystem,
        _namespace,
	_hash);
      length[_filesystem][_namespace][_hash] = _length;
      lockLength(
        _filesystem,
        _namespace,
        _hash);
    }

    /**
     * @dev Returns total chunks for a file.
     * @param _filesystem File system 1.0 address.
     * @param _namespace Address owning the hash.
     * @param _hash Hash of the file the chunk belongs.
     */
    function getLength(
      address _filesystem,
      address _namespace,
      string memory _hash) public view virtual returns (uint256) {
      checkLengthLocked(
        _filesystem,
        _namespace,
        _hash);
      return length[_filesystem][_namespace][_hash];
    }

    /**
     * @dev Check file length unlock state.
     * @param _filesystem File System 1.0 address.
     * @param _namespace Address owning the hash.
     * @param _hash Hash of the file to check length lock.
     */
    function checkLengthUnlocked(
      address _filesystem,
      address _namespace,
      string memory _hash)
      public
      view {
      require( ! lock[_filesystem][_namespace][_hash] );
    }

    /**
     * @dev Check file length lock state.
     * @param _filesystem File System 1.0 address.
     * @param _namespace Address owning the hash.
     * @param _hash Hash of the file the chunk belongs.
     */
    function checkLengthLocked(
      address _filesystem,
      address _namespace,
      string memory _hash)
      public
      view {
      require(
	lock[_filesystem][_namespace][_hash]
      );
    }

    /**
     * @dev Lock the length.
     * @param _filesystem File System 1.0 address.
     * @param _namespace Address owning the hash.
     * @param _hash Hash of the file.
     */
    function lockLength(
      address _filesystem,
      address _namespace,
      string memory _hash)
    public
    {
      checkOwner(
        _namespace
      );
      checkLengthUnlocked(
        _filesystem,
        _namespace,
        _hash);
      lock[_filesystem][_namespace][_hash] = true;
    }
}
