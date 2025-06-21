// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DepositoCauzionale {
    address public proprietario;
    address public inquilino;
    uint public deposito;
    bool public restituito;

    constructor(address _inquilino) {
        proprietario = msg.sender;
        inquilino = _inquilino;
        restituito = false;
    }

    function pagaDeposito() public payable {
        require(msg.sender == inquilino, "Solo l'inquilino puo pagare");
        require(msg.value > 0, "Il deposito deve essere maggiore di 0");
        require(deposito == 0, "Deposito gia pagato");
        deposito = msg.value;
    }

    function restituisciDeposito() public {
        require(msg.sender == proprietario, "Solo il proprietario puo restituire");
        require(deposito > 0 && !restituito, "Nessun deposito da restituire");
        restituito = true;

        (bool success, ) = payable(inquilino).call{value: deposito}("");
        require(success, "Trasferimento fallito");
    }

    function saldoContratto() public view returns (uint) {
        return address(this).balance;
    }
}

