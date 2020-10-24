pragma solidity ^0.4.24;

contract Ownable {  // Gestiona la propiedad de los contratos que lo hereden
 
  address internal owner;   // "internal" equivale al "protected" de un lenguaje normal
  
  constructor() public {
      owner = msg.sender;   // Es el propietario siempre el que ejecuta la transacción de despliegur del contrato
  }   
  
  modifier isOwner() {
      require(owner == msg.sender);
      _;
  }
}

