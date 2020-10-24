pragma solidity 0.4.24;  // pragma solidity ^0.4.24

import "./Ownable.sol";

contract MessageStore is Ownable {  // Herencia en Solidity: Ownable es la clase base.
    
    string private message;
    
    function setMessage(string newMessage) public payable { // isOwner {  // payable indica q este método solo puede ser invocado
        require(msg.value == 3 ether);
        message = newMessage;                                        // solo si se envia una cantidad de divisa
    }
    
    function getMessage() public view returns (string) {  // view indica q la función no se almacenará en la cadena de bloques ni en el contrato
        return message;       // Esta función no tiene un coste asociado
    }
    
    function getBalance() public view returns (uint) {    // "view" indica q no va a modificar el contrato
        // return this.balance;  // Obsoleto
        return address(this).balance;
    }
    
    function getBalanceInEther() public view returns (uint) {
        return getBalance() / 1e18;
    }
    
    function transfer(uint amount) public isOwner {   // Función para enviar divisas al propietario
        require(address(this).balance >= amount);
        owner.transfer(amount);
    }
}


