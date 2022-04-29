Simular redes no GNS3  (ÚLTIMA ESPERANÇA!!!!)
    
    Primeiramente, fazer o download do GNS3
        Ir no site deles e fazer o download gratuitamene.
            
            Também precisa baixar a imagem de disco do Mikrotik 
            para ele poder reconhecer a marca do aparelho para emulação.
                Ir em mikrotik.com/download --> Cloud Hosted Router --> Raw disk image 
                --> Long-Term.

        Criar uma máquina virtual no VirtualBox
            Criar máquina
            Nome: Nome escolhido.
            Sistema Operacional: Linux (Vai automaticamente porque o Mikrotik é baseado em Linux)
            Versão: Linux 2.6 ou Unknown (Desconhecido)
                
            Tamanho da Memória: Padrão.
                    
            Disco Rígido: Criar um disco rígido virtual agora
                Tipo: VDI 
                    Armazenamento de disco rígido físico: Dinamicamente Alocado 
                    Tamanho do arquivo: 10 GB 
                    Criar --> a máquina virtual está criada.

        Inserir a ISO
            Configurações --> Armazenamento --> Clicar no CD vazio --> Clicar no CD do canto -->
            Selecionar um arquivo de CD/DVD virtual (Talvez apareça Selecionar um Disco Óptico Virtual) 
            --> Selecionar a ISO 
        
        Configurações de rede
            Configurações --> Rede --> Adaptador 1 --> Habilitar placa de rede --> Placa em modo bridge 
            --> Escolher a modo Wireless 

        Ligar a máquina virtual 
            Escolher as opções corretas
                Normalmente ele só vem system nas opções
                    Seguimento de comandos
                        I --> Y --> Y
                                
            Ele vai formatar a partição
                Antes de dar reboot, tirar a ISO 
                    Máquina --> Configurações --> Armazenamento --> Clicar no disco da ISO
                    --> Clicar no Cd do lado direito --> Remover disco do drive virtual.
                        Voltar na linha de comando --> Enter
                            Após isso, ele vai pedir para fazer uma checagem no disco, mas 
                                não precisa.
                                    Login: admin
                                    Senha: não tem
                    
            Colocar IP na interface
                NA OUTRA VEZ QUE EU FIZ NÃO DEU CERTO, ELE SÓ RECONHECIA O MAC ADDRESS DE CADA INTERFACE
                SEM CONFIGURAÇÃO, APÓS ACESSAR ELE JÁ PEDIA A LICENÇA 
                    ip address add address ip do range disponível netmask máscara interface=ether1
                    ip route add gateway 192.168.1.1
                        Fazer o mesmo processo com o outro script 

        Após baixar o GNS3, fazer a instalação:
            Next 
            I agree 
            Next
                Em Choose Components tem os componentes de instalação
                    Selecionar: WinPCAP 4.1.3
                    Desabilitar: Intel Hardware Acceleration e Solar PuTTy 
                        Dar next no resto das opções
                            Após isso, ele irá te perguntar se voce quer comprar 
                            a licença deles, selecionar NO e apertar em next

        Integrar com o GNS3
            edit --> preferences --> VirtualBox --> VirtualBox VMs --> New --> Selecionar a máquina 
                Finish
                    Com a máquina virtual já aparecendo, apertar no botão direito, router_netflow, 
                    alterar para o grupo routers.
                        Apply Ok

                


