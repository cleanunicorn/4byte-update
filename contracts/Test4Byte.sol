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

    function weirdName() public {
        emit MsgSig(msg.sig);
    }

    function weirdName1() public {
        emit MsgSig(msg.sig);
    }    

    function anotherWeirdName() public {
        emit MsgSig(msg.sig);
    }

    function emitError() public {
        revert Aer__setParam_unrecognizedParam();
    }

    function showError() public {
        (bool success, bytes memory result) = address(this).call(
            abi.encodeWithSelector(
                this.emitError.selector
            )
        );

        emit Bytes(result);
    }
}