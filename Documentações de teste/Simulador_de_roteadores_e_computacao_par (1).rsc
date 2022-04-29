Simulador de roteadores e computação para configurações e testes
    O que será usado?
        WinBox
        VirtualBox
        ISO do Mikrotik no VirtualBox 
    
        Primeiramente precisa-se importar uma máquina virtual no VirtualBox
            Clicar em novo
                Nome: colocar o nome escolhido
                Tipo: Linux
                Versão: Linux 2.6/3.x/4.x (64 bits)
                    Próximo: Tamanho da memória
                        256 MB --> Tamanho indicado --> Colocar.
                            Próximo: Disco Rígido
                                Não acrescentar um disco rígido virtual.
                                    Criar.
    
        Configurar a ISO da máquina virtual
            Configurações --> Armazenamento --> Adicionar disco rígido --> Criar 
            novo disco.
                Tipo de arquivo de disco rígido: VDI (VirtualBox Disk Image) --> Próximo
                    VDI é a padrão.
                Armazenamento em disco rígido: Dinamicamente Alocado --> Próximo
                Localização e tamanho do arquivo: Deixar as configurações padrão
                    Nome: Qualquer
                    Tamanho da imagem: 8,00 GB
                        CRIAR
                            O HD ESTÁ CRIADO.
        
        Instalar o sistema operacional no HD
            Configurações --> Armazenamento --> Controladora IDE --> Selecionar o vazio
            --> Apertar no cd próximo dos atributos --> Selecionar Arquivo de Disco óptico 
            Virtual.
                Buscar o local onde foi salvo a ISO do Mikrotik.

        Configurar a rede do Sistem Operacional que está sendo instalando.
            Configurações --> Rede --> Adaptador 1 --> Habilitar Placa de Rede --> Placa em 
            modo Bridge.
                Adaptador 2 --> Habilitar Placa de Rede --> Placa em modo Bridge 
                    Criar 4 adaptadores com o mesmo segmento.

        Iniciar a máquina
            Escolher os pacotes que serão utilizados.
                SYSTEM: Do próprio sistema
                PPP: Conexão Ponto a Ponto 
                DHCP: Disponibilização de IP
                Advanced-tools: Ferramentas Avançadas
                Hotspot: é a denominação de um determinado local onde uma rede sem fio (tecnologia Wi-Fi) 
                está disponível para ser utilizada.
                MPLS: Essa tecnologia é um protocolo de chaveamento de pacotes que possibilita o encaminhamento 
                e a comutação dos fluxos de dados através de rede, com mais eficiência.
                NTP: É o padrão que permite a sincronização dos relógios dos dispositivos de uma rede
                Routerboard: É o nome dado a uma série de produtos MikroTik que combina o RouterOS com uma linha de 
                hardware próprio.
                Routing: Roteamento.
                Security: Segurança
                User-Manager: é o sistema de gerenciamento que pode ser usado em vários tipos de configuração.
                IPV6: protocolo de endereçamento mais atualizado.
                    Não se usa mouse e para escolher se usa o espaço.

        Criar a partição, formatação de disco, instalação do sistema e pacotes escolhidos
            Primeira Pergunta: y
            Segunda Pergunta: y
                Pressionar ENTER para dar reboot, reiniciar.
                    Ele vai aparecer para instalar pacotes novamente
                        Acontece isso porque o CD está dando boot 
                            Desligar a máquina.

        Fazer as seguintes configurações após isso:
            Configurações --> Armazenamento --> Clicar na ISO do Mikrotik --> botão direito --> Remover
                Após isso reinicia o servidor de novo.
                    Primeira pergunta: y

        Login
            Normalmente o login é admin
            Normalmente a senha é em branco
                PRONTO!!, JÁ ESTÁ DENTRO DO MIKROTIK!

        Adicionar as configurações de IP
            ip address
            ip address> add address=(IP ESCOLHIDO netmask Máscara escolhida) interface=ether (Clicar duas vezes o TAB) 
                Aqui ele irá mostrar as interfaces disponíveis
                    Normalmente tem:
                        ether1
                        ether2
                        ether3
                        ether4
             ip address> add address=(IP ESCOLHIDO netmask Máscara escolhida) interface=(interface escolhida)
                Sair dos modos específicos: ...
                    Pingar o ip do gateway
                        Exemplo: ping 192.168.0.1
                            Ele deve pingar.
    
        Acessar no Winbox
            Em Connect to: "Colocar o IP que foi configurado na interface"
            Login: admin
                Connect 
                    Ele vai te dar uma licença de 24 horas, porém o correto é pesquisar uma 
                    licença full no google para conseguir trabalhar sem ficar expirando a senha.
                        License --> Import Key --> Selecionar a licença e dar next nos próximos passos.
                            Ele vai rebootar a vm
                                Logar novamente.
                                    Logar novamente no WinBox também 
                                        Ele já irá ligar direto após colocar o ip

                PRONTO!!, AGORA É POSSÍVEL FAZER AS CONFIGURAÇÕES DO MIKROTIK PELO WINBOX. 
            
             

        


                



                

    



                


    