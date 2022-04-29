Simular redes do Mikrotik
    
    Precisa do VMware e EVE-NG
    Como no físico, também terá acesso ao WinBox
        
        Primeiramente já foi instalado o VMware 
            Para instalar a OVA é só ir no site RedesBrasil e ir para 
            "Aprenda a instalar e usar o EVE-NG para emular roteadores 
            da Mikrotik" 
                Nesse artigo estará disponível um link para baixar a ISO 
                E a Máquina Virtual.
                    Este link irá te direcionar para um site da EVE e lá
                    estará disponível o arquivo de instalação da ISO e a 
                    OVA da máquina virtual.
        
        Após importar a máquina virtual no sistema operacional Linux, ele irá 
        abrir na linha de comando, e antes mesmo de fazer o login ele irá disponibilizar 
        um IP.
            Deve-se colocar o IP nem algum navegador e ele abrirá uma tela de login do EVE
                Usuário: admin
                Senha: EVE
                    Após isso ele vai abrir um laboratório de configuração com interface
                    gráfica.

        Adicionar um novo laboratório
            Name: Nome escolhido 
                Pode colocar o autor do projeto 
                    PRONTO!!, O laboratório está sendo acessado

        Começar as configurações   
            Clicar em Node, que seria um nó de rede que seria os próprios routers
                Após pesquisar o tipo Mikrotik ainda não estará disponível, porque ainda não 
                foram colocadas as imagens.
                    Com isso, precisará acessar o servidor no putty via SSH, colocando o IP 
                    disponibilizado.
                        Usuário: root 
                        Senha: eve 
                            Foi acessado o servidor em conexão remota

        Primeiras Configurações
            Criar uma pasta:
                mkdir -p /opt/unetlab/addons/qemu/mikrotik-6.40.3

            Entrar na pasta:
                cd /opt/unetlab/addons/qemu/mikrotik-6.40.3

                    Dentro da pasta, fazer o download da imagem do Router os
                        wget https://download2.mikrotik.com/routeros/6.40.3/chr-6.40.3.vmdk

                    Olhar se ele foi instalado
                        ls
                        Fazer o comando dentro da pasta mesmo
            
            Converter para uma extensão que o qemu consiga reconhecer
                Qemu é um emulador e virtualizador que o EVE usa.

                Comando:
                    /opt/qemu/bin/qemu-img convert -f vmdk -O qcov2 chr-6.40.3.vmdk hda.qcov2
                        Dando o ls ele já vai mostrar a imagem connvertida.

            Comando para que ele ajuste algumas aplicações do arquivo 
                /opt/unetlab/wrappers/unl_wrapper -a fixpermissions

            Apagar a imagem vmdk
                Como a imagem já foi convertida para uma outra linguagem compatível, não é preciso continuar
                com a imagem vmdk.

                    Comando: rm -rf chr-6.40.3.vmdk

        Abrir novamente o laboratório
            Quando for digitado o modelo do mikrotik, ele estará disponível para ser configurado
                Number of nodes --> Número de roteadores = 4
                    Aqui será escolhido as informações de acordo com o que foi pedido
        
        Criar uma rede para o acesso aos routers
            Botão direito --> network --> Escolher a opção "Management Cloud", o resto pode deixar como padrão.

            Cabear a rede
                Ao lado da nuvem de acesso tem um símbolo de cabo, é só arrastar para os roteadores e Escolher
                a interface que será plugada.
                    Interligar os routers um atrás do outro e escolher a interface.
                        é possível também adicionar um PC
                            Botão direito --> Node --> VPC (Virtual PC) --> Ligar o router com a interface correta

            Clicando em algum roteador e clicando em link, ele irá fazer usa a conexão via putty
                Se não der certo, é porque o pacote telnet para essa aplicação não está habilitado
                    Para habilitar é só ir ao site eve.ng.net ir em Downloads e baixar o pacote em Windows Client Side.

            Logar o roteador: o usuário é admin e a senha é em branco

        Acessar Via WinBox
            Entrar no roteador mais próximo do provedor de acesso

                Verificar o endereço IP
                    ip address print 
                        Se não aparecer o ip automaticamente, é porque ele não atribuiu DHCP Client

                Para verifica DHCP Client
                    ip dhcp-client print 
                        Se ele não aparecer nada, ele deve ser configurado.
                            ip dhcp-client add interface=interface escolhida disabled=no
                                Verificar se apareceu 
                                    ip address print
                                        Agora ele deve aparecer.
                
                Conectar com o IP que está aparecendo no ip address print na conexão do WinBox
                    Após isso, ele estará conectado para as configurações.
                        Em IP --> Neighbors, se estiver conectado com o cabo, ele já aparece a interface e 
                        o outro router conectado.
                            Não é possível acessar os outros roteadores n WinBox diretamente, para conseguir,
                            deve-se habilitar uma funcionalidade chamada ROMON
                                Ativar em todos os roteadores conectados.
                                    Para Habilitar:
                                        tool romon set enabled=yes (Colocar em todos os roteadores)
                                            Quando começar uma nova sessão do WinBox, colocar o ip do primeiro router configurado
                                            e apertar em "Connect from RoMON", com isso irá aparecer os outros roteadores disponíveis.
                                                Interessante deixar marcado Open In New Window 
                                                    Normalmente na versão de endereçamento que o EVE dá, no quarto octeto aparece o número
                                                    do roteador que foi aplicado, para acessá-lo, é só selecionar e clicar em Conect.
                                                        Após colocar o nome, ele aparece o nome do lado para identificá-los.
                                                        





    
        



                    



            