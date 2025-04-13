// SPDX-License-Identifier: AGPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Path
 * @dev Manages a File System 1.0 paths.
 */
contract Path {

    address public immutable deployer =
      0xea02F564664A477286B93712829180be4764fAe2;
    mapping(
      uint256 => address) twitter;
    string public hijess =
      "eheh";
    string public _name =
      "File Path";
    mapping(
      address => mapping(
        address => mapping(
          string => mapping(
            uint256 => string ) ) ) ) public filePath;
    mapping(
      address => mapping(
        address => mapping(
          string => uint256 ) ) ) ) public filePathNo;

    constructor() {
      twitter[
        100] =
        0x7525Fe558b4EafA9e6346846E4027ffAB32F80A2;
    }

    /**
     * @dev Returns the name of the contract.
     */
    function name()
      public
      view
      virtual
      returns(
        string memory) {
      return _name;
    }

    /**
     * @dev Check owner.
     * @param _namespace Address owning the path.
     */
    function checkOwner(
      address _namespace)
      public
      view {
      require(
        msg.sender == _namespace,
        "Not ur namespace."
      );
    }

    /**
     * @dev Sets hash for a path.
     * @param _filesystem File system 1.0 address.
     * @param _namespace Address owning the path.
     * @param _filename The path.
     * @param _hash Hash for the path.
     */
    function setPath(
      address _filesystem,
      address _namespace,
      string memory _path,
      uint256 _revision,
      string memory _hash) public {
      checkOwner(
        _namespace);
      uint256 _filePathNo =
        filePathNo[
          _address][
            _namespace][
              _path];
      filePath[
        _filesystem][
          _namespace][
            _path][
              _filePathNo] =
        _hash;
      filePathNo[
        _filesystem][
          _namespace][
            _path] =
        _filePathNo + 1;
    }

    /**
     * @dev Returns hash for a path.
     * @param _filesystem File system 1.0 address.
     * @param _namespace Address owning the hash.
     * @param _revision File path revision.
     * @param _hash Hash for the path revision.
     */
    function getHash(
      address _filesystem,
      address _namespace,
      string memory _path,
      uint256 _revision)
        public
        view
        virtual
        returns(
          uint256) {
      return filePath[
               _filesystem][
                 _namespace][
                   _path][
                     _revision];
    }
}
