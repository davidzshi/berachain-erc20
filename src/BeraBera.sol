// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BeraBera is ERC20 {
    uint256 public constant INITIAL_SUPPLY = 1_000_000 * 1 ether;
    uint256 public constant BURN_PERCENTAGE = 1; // 1% 
    address public constant BURN_ADDRESS = 0xDeaDbeefdEAdbeefdEadbEEFdeadbeEFdEaDbeeF;

    constructor() ERC20("BeraBera", "BaBa") {
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    function _update(address from, address to, uint256 amount) internal override {
        if (from != address(0) && to != address(0)) {
            // This is a regular transfer, not a mint or burn operation
            uint256 burnAmount = (amount * BURN_PERCENTAGE) / 100;
            uint256 amountAfterBurn = amount - burnAmount;

            // Perform the burn by sending burnAmount to the burn address
            super._update(from, BURN_ADDRESS, burnAmount);

            // Adjust the amount for the actual transfer
            amount = amountAfterBurn;
        }

        // Proceed with the transfer, mint, or burn operation
        super._update(from, to, amount);
    }
}
