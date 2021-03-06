pragma solidity 0.4.24;  // pragma solidity ^0.4.24

contract MessageStore {  // "contract" define un contrato
    address private owner;
    string private message;
    
    constructor() public {
        owner = msg.sender;  // msg.sender es una var. de entorno
    }
    
    function setMessage(string newMessage) public payable { // isOwner {  // payable indica q este método solo puede ser invocado
        require(msg.value == 3 ether);
        message = newMessage;                                        // solo si se envia una cantidad de divisa
    }
    
    function getMessage() public view returns (string) {  // view indica q la función no se almacenará en la cadena de bloques ni en el contrato
        return message;       // Esta función no tiene un coste asociado
    }
    
    modifier isOwner() {   // Modificador personalizado. Similar a lo que llaman decorador en otros lenguajes.
        require(owner == msg.sender);
        _;
    }
}
