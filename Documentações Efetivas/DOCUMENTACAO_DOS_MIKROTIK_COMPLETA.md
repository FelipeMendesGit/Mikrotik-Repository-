DOCUMENTAÇÃO DOS MIKROTIK
    
    Configurações básicas do roteador Mikrotik

        Para acessar, precisa ter o Winbox.
            Para conseguir é só pesquisar Winbox no Chrome e baixar no 
            site principal.

        Na tela inicial, colocar o login admin.

            Alguns mikrotiks já vem com uma configuração padrão, porém não é indicada.
                Ele normalmente aparece uma tela, para configurar de maneira mais eficaz aperte em 
                remove configurations, com isso ele vai ficar zerado para uma nova configuração.
                    COMO SE ELE FOSSE UM CD VIRGEM

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



    !TUTORIAL PARA CONFIGURAR OSPF ROTEADOR MIKROTIK

        WINBOX DO MIKROTIK
	
	        Para fazer o protocolo funcionar primeiramente 
	        faça o seguinte:
	
	            Routing --> OSPF --> Instances

            Precisa definir uma instancia de roteamento do OSPF.
                Clicando duas vezes na default, vai abrie a tabela de configuração da
                instancia.

                Por padrão vem default.

            Router ID: colocar o maior ip configurado na caixa.
	
            Agora precisa informar ao OSPF as interfaces vão estar escutando o broadcast 
            OSPF e quais vão fazer parte do processo do protocolo.
	            Na mesma tabela ir em:
		            network --> + --> Adicionar o ip de uma rota -- Apply
			            Exemplo ----> (Network: 192.168.12.0) -> Apply
                                      (Network: 192.168.13.0) -> Apply
                            
            A Maneira Tradicional é fazer um por vez de maneira rápida.

            Voltando em Instances, ela deve estar como yes, porque ela já identificou as 
            interfaces que farão parte desse processo.

                FAZER O PROCESSO TODO EM TODOS OS ROUTERS.

            Acessar a linha de comando de cada roteador no putty
                Ver os IP's que foram associados:
                    ip address print 

            Após ver se os ID's foram associados, pingar algum ip desse ID:
                Exemplo: ID: 192.168.23.0
                    Deverá pingar 192.168.23.1 ou qualquer outro
                        O comando de ping é igual aos outros
                            Ambos devem estar pingando

            Para ver se deu tudo certo com a instancia:
                /routing ospf instance print
                    Nesse comando, ele deverá mostrar o nome da instancia com algumas outras 
                    informações.

            Para entrar no modo de configuração do roteamento OSPF
                /routing ospf network

            Fazer as seguintes configurações:
                add
                Vai estar no modo add

                network=192.168.0.0/16 area=backbone

                    FEITO ISSO O PROTOCOLO VAI IDENTIFICAR AS INTERFACES QUE ESTÃO NESSE RANGE E A INSTANCIA
                    OSPF DEVE SUBIR 

            Para sair de algum meio:
                ..

            Fazer o comando:
                ip address print

                Ele deve aparecer o endereço em ADDRESS e o ID em NETWORK.
                Ele sempre irá associar o maior ip da caixa de ip's

            Na tabela de rotas devem aparecer os ips de cada interface
                Para ver:
                    IP --> Routes

                Já é possível verificar que o OSPF está funcionando juntamente com os ID's, 
                ele costuma aparecer como DAo.

                Também é possível ver em OSPF --> Routes
                    Nessa versão é possível ver que ele consegue balancear a rota.

            Adicionar os ips que interligam a rota entre os roteadores para os computadores, 
            colocar de acordo com o ip que está na topologia.

                Routing --> OSPF --> Networks --> + --> adicionar o ip --> Apply.
                    Fazer isso em todos de acordo com seus ips.

            Pingar os ips que acabaram de ser adicionados, ou seja, os ips da rota entre 
            os roteadores e computadores (Rede Local).
                Esse teste é necessário porque o computador também precisa ter acesso ás rotas.
                    NÃO PINGAR O ID, PINGAR O PRIMEIRO IP VÁLIDO.

            Aquele roteador que está com duas rotas, (que provavelmente será todos), deverá alterar 
            o custo para 20, porque o custo já vem por padrão com 10.

                Routing --> OSPF --> (Clicar na interface que voce quer alterar) --> Copy 
                --> Cost=20 --> Apply.




    CONFIGURAÇÕES DO OSPF IPv6 na interface gráfica

        Ele tem uma rota padrão IPV6

            Não precisa colocar ip nas interfaces, porque eles já tem 
            endereços de link-local que o roteador utiliza para fechar a 
            sessão OSPF, ou seja não precisa de endereço público para rodar 
            o OSPFv3 (OSPF com IPv6).

            O OSPFv3 não tem a aba (Networks), porque o OSPFv3 é baseado
            nas interfaces e não nas redes isso porque já tem o endereço
            de link-local em cada uma das interfaces, então não precisa 
            informar a network.

        Primeiramente:
            Adicionar router ID na instancia default (padrão) 
                Routing --> OSPFv3 --> Instances --> Router ID = IP de loopback usado (IPv4) 
                    Pode usar um IP de loopback específico também
                Redistribute Default Route = Always (as type 1) --> Ok
                    Para ele poder distribuir a rota default (Padrão) 
        
        Adicionar a interface que o OSPFv3 vai acessar:
            Routing --> OSPFv3 --> Interfaces --> + --> Interface = Interface escolhida
            Network Type --> point to point --> Ok
    
        Adicionar uma interface para loopback
            IPv6 --> Addresses --> + --> Interface = loopback 
                Addresses = ip de loopback (IPv6) 
                    Desativar "Advertise" --> Ok
            Interfaces --> + --> Interface = loopback --> Ok
                Neighbors --> Botão direito do mouse --> Show Columns --> State 
                    FAZER ISSO NOS OUTROS ROTEADORES TAMBÉM 
                    NÃO COPIAR O IP IGUAL, PROVAVELMENTE UM VAI SER O IP 1 E O OUTRO 2 E ASSIM 
                    POR DIANTE.
        


    CONFIGURAÇÕES NA LINHA DE COMANDO

        OS ENDEREÇOS IP SÃO APENAS DE EXEMPLO.

        USAR O SCRIPT DE EXEMPLO, POIS NA TOPOLOGIA ORIGINAL TEM 5 ROTEADORES. 

	    São necessários para rodar o OSPFv3, os
	    seguintes pré-requisitos:
		    - RouterOS (pode ser a versão CHR para testes
		    no GNS3);
		    - Pacote IPv6;
		    - Prefixo para uso (caso não tenha um prefixo
		    global, pode usar o prefixo de documentação,
		    conforme proposto na RFC 3849).

        Roteador 1

	        /ipv6 address add address=2001:db8:1::1/64 interface=ether1 advertise=yes

	        /ipv6 address add address=2001:db8:10::1/64 interface=ether5 advertise=no

	        /ipv6 address add address=2001:db8::1/128 interface=loopback advertise=no

	        /routing ospf-v3 interface add interface=ether1 area=backbone

	        /routing ospf-v3 interface add interface=ether5 area=backbone

	        /routing ospf-v3 interface add interface=loopback area=backbone

	        /routing ospf-v3 instance set redistribute-connected=as-type-1 default

	        /routing ospf-v3 instance set redistribute-connected=as-type-1 default

	        /routing ospf-v3 instance set router-id=0.0.0.1 default

        Roteador 2
	
	        /ipv6 address add address=2001:db8:10::2/64 interface=ether1 advertise=no

	        /ipv6 address add address=2001:db8:11::1/64 interface=ether5 advertise=no

	        /ipv6 address add address=2001:db8::2/128 interface=loopback advertise=no

	        /routing ospf-v3 interface add interface=ether1 area=backbone

	        /routing ospf-v3 interface add interface=ether5 area=backbone

	        /routing ospf-v3 interface add interface=loopback area=backbone

	        /routing ospf-v3 instance set redistribute-connected=as-type-1 default

	        /routing ospf-v3 instance set redistribute-connected=as-type-1 default

	        /routing ospf-v3 instance set router-id=0.0.0.2 default

        Roteador 3 

	        /ipv6 address add address=2001:db8:11::2/64 interface=ether1 advertise=no

	        /ipv6 address add address=2001:db8:2::1/64 interface=ether5 advertise=yes

	        /ipv6 address add address=2001:db8::3/128 interface=loopback advertise=no

	        /routing ospf-v3 interface add interface=ether1 area=backbone

	        /routing ospf-v3 interface add interface=ether5 area=backbone

            /routing ospf-v3 interface add interface=loopback area=backbone

	        /routing ospf-v3 instance set redistribute-connected=as-type-1 default

	        /routing ospf-v3 instance set redistribute-connected=as-type-1 default

	        /routing ospf-v3 instance set router-id=0.0.0.3 default


        
    




    