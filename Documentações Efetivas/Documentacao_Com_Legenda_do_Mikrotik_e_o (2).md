Documentação Com Legenda do Mikrotik e o roteamento usado.
    
    Esta documentação tem como objetivo explicar passo a passo o direcionamento das 
    configurações aplicadas nesses equipamentos.

        Configurações Básicas:
            Primeiramente, é preciso fazer as configurações gerais para poder implementar o sistema
            de roteamento
            
                Para começar as configurações, precisa-se conectar o computador com o aparelho
                com um cabo de rede.
                    Conectar na porta 2 do roteador, e na porta de entrada de cabo de rede do 
                    computador
        
                As configurações são feitas a partir do WinBox 
                    WinBox é um software de configuração que os Mikrotiks usam.
                        Para baixar o WinBox, é só pesquisar por ele em algum navegador, clicar no 
                        primeiro site e apertar para fazer o download.
                            Na tela inicial, colocar o login admin.
                                Alguns mikrotiks já vem com uma configuração padrão, porém não é indicada.
                                    Ele normalmente aparece uma tela. Para configurar de maneira mais eficaz aperte em 
                                    remove configurations, com isso ele vai ficar zerado para uma nova configuração.
                                        Como se fosse um cd virgem
                
                A primeira configuração que deverá ser feita é colocar uma senha, porque eles são muito 
                sucetíveis á ataques externos, e eles acontecem em questão de minutos.
                    System --> Users --> Apertar no usuário --> Password --> Colocar e confirmar a senha --> Ok.
                        System: Sistema
                        Users: Usuário que está conectado com aparelho, é nele que será colocado a senha para
                        protege-lo de ataques e invasões, principalmente se ele for o administrador.
                        Password: onde será escrita o nome da senha.
                        Confirm Password: Ele serve para confirmar se a senha foi colocada corretamente, se não for
                        escrito igual, dará erro.

                O próximo passo é colocar o nome.
                    System --> Identify --> Colocar o nome do mikrotik --> Ok
                        System: Sistema
                        Identify: Identificação, aqui estarão as configurações baseadas na identificação do equipamento,
                        o próprio hostname é um protocolo de identificação.
                        Name: O local para escrever o nome escolhido para o aparelho.

                Comentar as interfaces 
                    Comentar seria o comentário para identificar a função das portas, rotas e etc.
                        Interfaces --> Selecionar a porta 1 (ether1) --> apertar na caixa amarela --> 
                        Escrever o comentário --> Ok
                            Interfaces: é a fronteira que define a forma de comunicação entre duas entidades, no caso equipamentos
                            e Hardwares em geral.
                                Selecionar a porta escolhida
                            Yellow Box: é uma caixinha amarela que armazena os comentários de identificação e função.

                Configurar o link DHCP
                    O protocolo DHCP é um protocolo de cliente/servidor que fornece automaticamente um host ip (protocolo IP) com seu endereço IP 
                    e outras informações de configuração relacionadas, como a máscara de sub-rede e o gateway padrão.
                        Ele basicamente fornece o endereço, pois os equipamentos de rede conversam a partir desses endereços
                            Este endereço precisa de alguns auxiliares para funcionar como por exemplo a máscara e o gateway que será explicado abaixo.
                                IP --> DHCP Client --> + --> Colocar a interface correta --> Marcar as duas opções,
                                normalmente a "Use Peer DNS" vem desativada --> Deixe como yes a "Add Default Route", 
                                para adicionar uma rota padrão --> Advanced --> Default Route Distance: Colocar 2 
                                para deixar ele de backup (Rota Secundária).
                                    IP: é o protocolo de endereçamento.
                                    Máscara: é um número de 32 bits usado em um IP para separar a parte correspondente à rede pública, à sub-rede e 
                                    aos hosts. Host é qualquer equipamento dentro da rede.
                                    Gateway: é basicamente um condutor que te leva para a conexão de rede.
                                    DHCP Client: é o cliente no mundo do protocolo DHCP, ou seja, ele vai fornecer o endereço ao cliente
                                    + : adicionar a configuração.
                                        Adicionar a interface correta
                                            Marcar as opções 
                                    Use Peer DNS: o DNS é protocolo que resolve nome de domínio, então com ele configurado, não é necessário saber
                                    o endereço IP para pesquisar ele em uma rede, é só pesquisar pelo nome, esse protocolo basicamente converte e 
                                    transforma possível a tradução da linguagem de computador que é a linguagem binária ou através de endereços IP's, para 
                                    linguagem humana.
                                        Peer: O ponto a ponto é um tipo de configuração de linha que descreve o método para conectar dois dispositivos de comunicação 
                                        em um link. 
                                            Então ele vai fazer permitir a conexão ponto a ponto com o protocolo DNS habilitado.
                                    Default Route: é a rota padrão, ou seja, é quase a rota principal, em outras palavras, é a rota de rede utilizada por um roteador quando não há nenhuma outra rota conhecida existente para o endereço de destino de um pacote IP.
                                    Advanced: São as configurações avançadas desse modo.
                                    Default Route Distance: é a distancia e o alcance da rota padrão.
                                        Rota secundária: colocando 2, ele irá abrir duas rotas padrões em seu alcance, no caso uma funciona para o serviço de backup.
                                            Backup: é um termo inglês que tem o significado de cópia de segurança, ou seja, ele guarda as informações para recuperá-las em caso de perda.
                Configurar o NAT
                    O NAT é um protocolo camuflagem de IP, ele troca a finalidade do Ip de privado para público e vice versa.
                        Ele foi criado com a finalidade de economia de IP's
                            O IP privado é usado apenas em redes locais, é impossível acessar a internet com esse tipo de IP.
                                Eles tem uma padronização em seus octetos e é dividido em classes.
                                    Classe C: 192.168.x.x
                                    Classe B: 172.16.x.x
                                    Classe A: 10.x.x.x
                            O IP público é usado nas redes externas, ou seja, para o acesso á internet.
                                Eles não tem uma padronização.
                                    Todos os IP's que não seguem essa padronização, são considerados públicos.
                            O NAT PEGA UM IP PRIVADO E O CAMUFLA PARA IP PÚBLICO QUANDO Á ACESSO Á INTERNET, E QUANDO O IP VOLTA PARA REDE LOCAL, ELE TRANSFORMA
                            O IP PÚBLICO PARA PRIVADO NOVAMENTE E FAZ UM CICLO.
                                O que fazer:
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
                                            IP: Configurações dos endereços.
                                            Firewall: é um sistema de segurança que protege a rede a partir de regras.
                                            NAT: o protocolo de camuflagem que está sendo configurado.
                                            + : adicionar
                                            Chain: Onde será colocado o nome do NAT de origem.
                                            Action: Ações a serem aplicadas.
                                            Masquerade: Mascarar os ips para eles obterem esse recurso necessário.
                                            General: Configurações gerais
                                            Out interface: interface de saída 
                                                Dentro desse contexto de NAT, uma interface será necessária para levar os pacotes para fora, que seriam
                                                as interfaces de saída, e aquelas que cuidam dos pacotes que entram dentro da rede, que são as interfaces 
                                                de entrada
                                                    Escolher a interface ethernet reponsável pela saída.
                                                        Todas as interfaces usadas devem ser definidas como entrada ou saída.
                                            Comentar: Adicionar um comentário de acordo com um link NAT.
                
                Configurar Servidor DHCP 
                    Como já foi explicado a definição de DHCP, é preciso ter um protocolo habilitado para o servidor e para o cliente 
                        Nessa questão, o DHCP funciona como um carteiro, ele vai entregar os endereços tanto para o servidor
                        tanto para os clientes.
                            IP --> IP Adresses 
                                Primeiramente determinar a faixa de ip que será utilizada.
                                    + --> Primeiramente uma faixa de ip privada,
                                        pode ser 192.168.0.1/24 - Exemplo
                                Faixa de IP: é o número de IP's que poderam ser usados e entregues.

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
                            DHCP Server: é o servidor DHCP que irá fornecer os endereços para conversa com clientes.
                            DHCP Setup: é a área de configuração do protocolo DHCP.
                            DHCP Address Space: é o espaço dos IP's de acordo com o ID
                                O ID de rede é um ip reservado para representar uma determinada rede, porém não pode ser usado porque não é 
                                um IP válido.
                            Gateway for DHCP Network: é ID do IP do condutor para a rede via DHCP.
                            Address to Give Out: é o range de ips que podem sair
                                Range: é um número de ips selecionados.
                            DNS Servers: Configuração para resolver os nomes de domínio.

                Configurar o Cliente DHCP
                    Logar na linha de comando do computador cliente 
                        Comandos usados:
                            dhcp
                            DORA 
                        DORA: Discover Offer Request Acknowledgement
                            Estratégia que o DHCP faz, a conversa entre o servidor e o cliente.
                                AUTOMATICAMENTE ELE GANHA O IP.
                            trace 8.8.8.8
                            Trace: Para traçar a rota.

        Automatização do roteamento
            Uma maneira de automatizar o roteamento é a utilização e implementação do Roteamento Dinamico 
                O Roteamento Dinamico usufrui de protocolos, que após configurados, eles funcionam automaticamente na rede
                    O protocolo escolhido foi o OSPF, que permite a divisão de uma rede em áreas e torna possível o roteamento 
                    dentro de cada área.
                        O OSPF informa a situação da rede para o monitoramento.
                            Para fazer o protocolo funcionar primeiramente faça o seguinte:
                                Routing --> OSPF --> Instances
                                    Routing: Roteamento, por ser um protocolo automatizado de rotas.
                                    Instances: Instancias, seria um local para colocar as principais configurações do OSPF como
                                    Router ID e etc.

                    Precisa definir uma instancia de roteamento do OSPF.
                        Clicando duas vezes na default, vai abrir a tabela de configuração da
                        instancia.
                            Por padrão vem default.
                            Router ID: colocar o maior ip configurado na caixa.
                            Agora precisa informar ao OSPF as interfaces vão estar escutando o broadcast 
                            OSPF e quais vão fazer parte do processo do protocolo.
                                Na mesma tabela ir em:
                                network --> + --> Adicionar o ip de uma rota -- Apply
                                    Exemplo ----> (Network: 192.168.12.0) -> Apply 
                                                  (Network: 192.168.13.0) -> Apply
                                    Default: Seria a instancia padrão, por padrão ela vem como default.
                                    Router ID: Seria o ID usado no roteamento, é para colocar o maior ip da caixa de IP's 
                                    configurados.
                                    Network: configurações de rede.
                                    +: Adicionar.
                                    Colocar os ID's e clicar em aplicar (Aplicar)

                                A Maneira Tradicional é fazer um por vez de maneira rápida.

                    Voltando em Instances, ela deve estar como yes, porque ela já identificou as 
                    interfaces que farão parte desse processo.
                            FAZER O PROCESSO TODO EM TODOS OS ROUTERS.

                    Acessar a linha de comando de cada roteador no putty
                        Ver os IP's que foram associados:
                            ip address print 
                                
                                Linha de comando: (comand line), é um meio de interagir com um programa de computador, onde o 
                                utilizador emite comandos para o programa sob a forma de sucessivas linhas de texto.
                                    Sem interface gráfica
                                        Interface gráfica: interface gráfica do utilizador ou usuário é um tipo de interface 
                                        do utilizador que permite a interação com dispositivos digitais por meio de elementos 
                                        gráficos como ícones e outros indicadores visuais.
                                            A linha de comando é só texto.
                                PuTTy: é um software que permite criar conexões com servidores de maneira remota.
                                    O putty é uma maneira muito eficaz para realizar os comandos em equipamentos através 
                                    da porta Serial.
                                        Porta Serial: é uma porta de comunicação utilizada para conectar pendrives, modems, mouses, 
                                        algumas impressoras, scanners e outros equipamentos de hardware.
                                    No putty também é possível acessar os equipamentos remotamente após o aparelho ter um IP configurado
                                    através da conexão via SSH
                                        SSH: é a sigla para Secure Socket Shell, sendo um dos protocolos específicos de segurança de troca 
                                        de arquivos entre cliente e servidor de internet, usando criptografia.
                                            Atualização do Telnet, que faz a mesma coisa, porém sem a criptografia se tornando menos seguro
                                                O Putty pode acessar máquinas virtuais e servidores na nuvem, porém apenas por linha de 
                                                comando
                                    Para acessar algum equipamento no Putty, é só colocar o cabo de rede na porta de console, ou na porta 2
                                    como é o caso do Mikrotik, e ligar o PuTTy, selecionar a opção Serial e coolocar a opção Serial, normal-
                                    mente é a COMM 4.
                                        Para ver, é só fazer o seguinte:
                                            Pressione simultaneamente as teclas Windows + X; Clique sobre a opção Gerenciador de Dispositivos; Clique na seta que aponta para Portas (COM e LPT); Caso não seja apresentada nenhuma porta, provavelmente elas estão desabilitadas na Bios.
                                                Apos ligar, estará dentro da linnha de comando do equipamento configurado
                                                    Se já tiver um IP configurado, é só ir na opção SSH e colocar o IP, essa conecção é
                                                    Wireless, ou seja, sem cabos.
                                        
                    Após ver se os ID's foram associados, pingar algum ip desse ID:
                        Exemplo: ID: 192.168.23.0
                            Deverá pingar 192.168.23.1 ou qualquer outro
                                O comando de ping é igual aos outros
                                    Ambos devem estar pingando
                                        Ping: é o comando do protocolo ICMP para testar a conectividade.
                                            Exemplo: ping 192.168.23.2
                                                Se aparecer algumas letras e números de forma rápida, significa que ele está
                                                funcionando e conectando, diferente se aparecer "Destination Host Unreachable" 
                                                significa que esse endereço não foi encontrado, já se não aparecer nada ou erro
                                                é porque talvez o host esteja fora de serviço

                    Para ver se deu tudo certo com a instancia:
                        /routing ospf instance print
                            Nesse comando, ele deverá mostrar o nome da instancia com algumas outras 
                            informações.

                    Para entrar no modo de configuração do roteamento OSPF
                        /routing ospf network
                            Entrando nesse modo, ele irá permitir as configurações específicas do OSPF.
                        
                    Fazer as seguintes configurações:
                        add
                        Vai estar no modo add
                            Esse modo adiciona algo no Mikrotik.
                                Como ele está dentro do modo de OSPF, ele vai adicionar algo relacionado ao OSPF
                                    network=192.168.0.0/16 area=backbone
                                        Network: Rede
                                            Após o IP junto com a máscara.
                                        área backbone: é uma infraestrutura responsável pelo transporte de dados, facilitando o 
                                        controle de redes, conectando usuários sem fronteiras geográficas e centralizando a 
                                        transferência de informações.
                            FEITO ISSO O PROTOCOLO VAI IDENTIFICAR AS INTERFACES QUE ESTÃO NESSE RANGE E A INSTANCIA
                            OSPF DEVE SUBIR 

                    Para sair de algum meio:
                    ..
                        Se não sair do modo OSPF, será impossível fazer outras configurações, no Mikrotik eles usam .. 
                    
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

                    Voltando no WinBox:
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
                                            Como foi configurada outra rota para fazer backup, o custo deve ser o dobro
                                                Padrão: 10

                    Configuração do OSPFv3
                        Após a criação do IPv6, foi necessário fazer a atualização do protocolo
                            IPV6 é o protocolo da internet. A versão 6 é a mais atual e sucede a anterior, IPV4. Ao enviar e 
                            receber informação pela internet, os dados são divididos em pacotes. Cada pacote é identificado 
                            por um endereço de quem envia e de quem recebe.
                                Tem a mesma função do IPv4 ou só IP, porém é uma versão atualizada.
                                    Ele precisou ser criado devido o esgotamento de IP no mundo, para solucionar esse problema
                                    eles criaram um protocolo que fosse praticamente "imune" ao esgotamento.
                                        o IPv6 tem uma estrutura diferente, e tem muito mais ips válidos que o IPv4
                                            OS ENDEREÇOS IP SÃO APENAS DE EXEMPLO.
                        
                        Para a construção dessa documentação foi encontrada uma maneira mais viável de habilitar o OSPF IPv6
                            A maneira foi configurar 100% na linha de comando
                                Acessar o dispositivo no PuTTy, como já foi explicado antes.
                                    O NÚMERO DE ROEADORES TAMBÉM É SÓUM EXEMPLO

                            Roteador 1

	                            /ipv6 address add address=2001:db8:1::1/64 interface=ether1 advertise=yes
                                    Adicionar os ips de acordo com as interfaces 
                                        
                                        ipv6 address: endereço ipv6 que será colocado
                                        add: adicionar, nesse caso é adicionar e habilitar o ipv6 que será colocado
                                            No caso fica: add address= endereço
                                        Interface: a interface escolhida para ser a de origem
                                            ficando como In Interface.
                                        ether1: é a interface escolhida para ser a interface de entrada ou saída
                                        advertise: aviso
                                            O OSPF avisa a situação da rede.
                                                Normalmente é uma opção habilitada apenas no roteador principal, porque
                                                é ele quem gere a rede.
                                        
                                /ipv6 address add address=2001:db8:10::1/64 interface=ether5 advertise=no
                                    Adicionar os ips de acordo com as interfaces
                                        
                                        ipv6 address: endereço ipv6 que será colocado
                                        add: adicionar, nesse caso é adicionar e habilitar o ipv6 que será colocado
                                            No caso fica: add address= endereço
                                        Interface: a interface escolhida para ser a de destino
                                            ficando como Out Interface.
                                        ether5: é a interface escolhida para ser a interface de entrada ou saída
                                        advertise: aviso
                                            O OSPF avisa a situação da rede.
                                                Normalmente é uma opção habilitada apenas no roteador principal, porque
                                                é ele quem gere a rede.
	                            
                                /ipv6 address add address=2001:db8::1/128 interface=loopback advertise=no
                                    Adicionar os ips de acordo com a interface loopback
                                    
                                        ipv6 address: endereço ipv6 que será colocado
                                        add: adicionar, nesse caso é adicionar e habilitar o ipv6 que será colocado
                                            No caso fica: add address= endereço
                                        Interface: loopback
                                            é um endereço especial que os hosts usam para direcionar o tráfego para si mesmos.
                                                um endereço reservado que precisa ser adicionado.
                                        advertise: aviso
                                            O OSPF avisa a situação da rede.
                                                Normalmente é uma opção habilitada apenas no roteador principal, porque
                                                é ele quem gere a rede.
	                            
                                /routing ospf-v3 interface add interface=ether1 area=backbone
                                    Adicionar o roteamento relacionado ao ipv6 com a área backbone
                                    
                                        Routing: Roteamento, para adicionar o modo do roteamento
                                        ospf-v3: é o modo OSPF para IPv6.
                                        interface add: adicionar a interface de entrada ou saída
                                        Area=backbone: adicionar a area backbone, como já foi explicado.

	                            /routing ospf-v3 interface add interface=ether5 area=backbone
                                    Adicionar o roteamento relacionado ao ipv6 com a área backbone

                                        Routing: Roteamento, para adicionar o modo do roteamento
                                        ospf-v3: é o modo OSPF para IPv6.
                                        interface add: adicionar a interface de entrada ou saída
                                        Area=backbone: adicionar a area backbone, como já foi explicado.

                                /routing ospf-v3 interface add interface=loopback area=backbone
                                    Adicionar o roteamento relacionado ao ipv6 com a interface loopback com a área
                                    backbone.
                                    
                                        Routing: Roteamento, para adicionar o modo do roteamento
                                        ospf-v3: é o modo OSPF para IPv6.
                                        interface add: adicionar a interface de loopback
                                        Area=backbone: adicionar a area backbone, como já foi explicado.

	                            /routing ospf-v3 instance set redistribute-connected=as-type-1 default
                                    Adicionar a instancia relacionado a redistribuição e conexão 
                                        Routing: Roteamento, para adicionar o modo do roteamento
                                        ospf-v3: é o modo OSPF para IPv6.
                                        Instance: Instancia do OSPF.
                                        set redistribute-connected: Redistribuição de rede relacionado á conexão
                                        Type: Tipo e modelo
                                            Normalmente é o Tipo 1
                                        Default: Relação com a rota padrão.

	                            /routing ospf-v3 instance set redistribute-connected=as-type-1 default
                                    Adicionar a instancia relacionado a redistribuição e conexão 
                                        Routing: Roteamento, para adicionar o modo do roteamento
                                        ospf-v3: é o modo OSPF para IPv6.
                                        Instance: Instancia do OSPF.
                                        set redistribute-connected: Redistribuição de rede relacionado á conexão
                                        Type: Tipo e modelo
                                            Normalmente é o Tipo 1
                                        Default: Relação com a rota padrão.
                                            DEVE-SE REPETIR O COMANDO PARA SER A SAÍDA E A ENTRADA 

	                            /routing ospf-v3 instance set router-id=0.0.0.1 default
                                    Adicionar a instancia com a sua relação com a rota padrão.
                                        Routing: Roteamento, para adicionar o modo do roteamento
                                        ospf-v3: é o modo OSPF para IPv6.
                                        Instance: Instancia do OSPF.
                                        set router-id= O ID da rota padrão.
                                        default: identificação de que é padrão.
                    
                        ESSAS DEFINIÇÕES DE COMANDOS SÃO IGUAIS EM TODOS OS ROUTERS, MUDANDO APENAS IP, ID E ETC.
                            
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





                