// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

import '../interface/IOwnable.sol';

abstract contract Ownable is IOwnable {

    address _controller;

    address _newController;

    modifier _controller_() {
        require(msg.sender == _controller, 'Ownable: only controller');
        _;
    }

    function controller() public override view returns (address) {
        return _controller;
    }

    function setNewController(address newController) public override _controller_ {
        _newController = newController;
    }

    function claimNewController() public override {
        require(msg.sender == _newController, 'Ownable: not allowed');
        _controller = _newController;
    }

}