Configurações básicas do roteador Mikrotik

Para acessar, precisa ter o Winbox.
    Para conseguir é só pesquisar Winbox no Chrome e baixar no 
    site principal.

Na tela inicial, colocar o login admin.

Alguns mikrotiks já vem com uma configuração padrão, porém não é indicada.
    Ele normalmente aparece uma tela, para configurar de maneira mais eficaz aperte em 
    remove configurations, com isso ele vai ficar zerado para uma nova configuração.
              Como se fosse um cd virgem

A primeira configuração que deverá ser feita é colocar uma senha, porque eles são muito 
sucetíveis á ataques externos, e eles acontecem em questão de minutos.
    System --> Users --> Apertar no usuário --> Password --> Colocar e confirmar a senha --> Ok.

O próximo passo é colocar o nome.
    System --> Identify --> Colocar o nome do mikrotik --> Ok

Comentar as interfaces 
    Interfaces --> Selecionar a porta 1 (ether1) --> apertar na caixa amarela --> 
    Escrever o comentário --> Ok

Configurar o link DHCP
    IP --> DHCP Client --> + --> Colocar a interface correta --> Marcar as duas opções,
    normalmente a "Use Peer DNS" vem desativada --> Deixe como yes a "Add Default Route", 
    para adicionar uma rota padrão --> Advanced --> Default Route Distance: Colocar 2 
    para deixar ele de backup (Rota Secundária).

Configurar o NAT
    IP --> Firewall --> NAT --> + 
        chain: srcnat --> Source nat
            Source= Origem
    --> Action: Masquerade --> Mascarar
    General --> Out Interface --> Escolher a interface
        Ele vai sair mascarando de qual interface??
            Essa interface que voce irá escolher
    FAZER ESSE PROCESSO EM TODAS AS INTERFACES, PARA SER MAIS RÁPIDO É SÓ APERTAR "COPY" E MUDAR A 
    INTERFACE PARA MASCARAR DE TODAS AS ORIGENS.
        Comentar as configurações do NAT, apertando no papel amarelo e escrevendo o necessário.
            Exemplo NAT Link 1
                    NAT Link 2
    
Configurar Servidor DHCP 
    IP --> IP Adresses 
        Primeiramente determinar a faixa de ip que será utilizada.
            + --> Primeiramente uma faixa de ip privada,
            pode ser 192.168.0.1/24 - Exemplo
   
    Criar o servidor
        IP --> DHCP Server --> DHCP Setup --> Adicionar a interface do link DHCP --> Next
            DHCP Address Space: 192.168.0.0/24 --> ID
            Gateway for DHCP Network: 192.168.0.1
                O mesmo ip colocado na faixa.
            Addresses to Give Out: 192.168.0.2 192.168.0.254
                Não pode colocar o ID e o primeiro ip válido já está em uso, 
                então colocar o segundo até o último, pode também restringir 
                um range de ip's se quiser.
            DNS Servers: Olhar o ip que está como padrão, pode colocar esse mesmo
                IP --> DNS --> Dynamic Servers 
                    Pode colocar os dois ip's disponíveis.
            Lease time: é o tempo que irá ser concedido esse ip para esses dispositivos 
            dentro da rede.
                Por padrão ele vem 10:00, 10 minutos, pode deixar como padrão 
            APÓS ESSAS CONFIGURAÇÕES O SERVIDOR DHCP ESTÁ CRIADO.
                Ele cria um pool automaticamente.
    
Configurar o Cliente DHCP
    Logar na linha de comando do computador cliente 
        dhcp
        DORA 
    DORA: Discover Offer Request Acknowledgement
        Estratégia que o DHCP faz, a conversa entre o servidor e o cliente.
        AUTOMATICAMENTE ELE GANHA O IP.
    trace 8.8.8.8
        Para traçar a rota.

        
    




    


    

