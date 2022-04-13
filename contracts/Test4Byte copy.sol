contract WeirdContract {
    event MsgSig(bytes4 sig);
    event Bytes(bytes data);

    error Aer__setParam_unrecognizedParam();
    error Aer__unqueueDebt_auctionDelayNotPassed();
    error Aer__settleDebtWithSurplus_insufficientSurplus();
    error Aer__settleDebtWithSurplus_insufficientDebt();
    error Aer__settleAuctionedDebt_notEnoughDebtOnAuction();
    error Aer__settleAuctionedDebt_insufficientSurplus();
    error Aer__startDebtAuction_insufficientDebt();
    error Aer__startDebtAuction_surplusNotZero();
    error Aer__startSurplusAuction_insufficientSurplus();
    error Aer__startSurplusAuction_debtNotZero();
    error Aer__transferCredit_insufficientCredit();
    error Aer__lock_notLive();

    error TEST_arguments(uint, uint);

    function weirdName() public {
        emit MsgSig(msg.sig);
    }

    function anotherWeirdName() public {
        emit MsgSig(msg.sig);
    }

    //

    function emitError1() public {
        revert Aer__setParam_unrecognizedParam();
    }

    function showError1() public {
        (bool success, bytes memory result) = address(this).call(
            abi.encodeWithSelector(
                this.emitError1.selector
            )
        );

        emit Bytes(result);
    }

    //

    function emitError2() public {
        revert TEST_arguments(0x11223344, 0x55667788);
    }

    function showError2() public {
        (bool success, bytes memory result) = address(this).call(
            abi.encodeWithSelector(
                this.emitError2.selector
            )
        );

        emit Bytes(result);
    }    

    //

    function emitRequire1() public {
        require(false, "Some kind of error ff0022");
    }

    function showError3() public {
        (bool success, bytes memory result) = address(this).call(
            abi.encodeWithSelector(
                this.emitRequire1.selector
            )
        );

        emit Bytes(result);
    }     
}