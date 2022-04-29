Oitava aula do curso Mikrotik Documentada.

    Instalação via Netinstall
        
        Netinstall transforma uma estação de trabalho Windows 
        em um servidor TFTP.
            
            Trivial File Transfer Protocol é um protocolo de transferência de ficheiros, 
            muito simples, semelhante ao FTP. É geralmente utilizado para transferir 
            pequenos ficheiros entre hosts numa rede, tal como quando um terminal remoto 
            ou um cliente inicia o seu funcionamento, a partir do servidor.
        
                * Pode ser instalado em um PC que tenha boot por placa de rede;
                * É possível instalar em uma routerboard, configurando-a para dar 
                boot via rede;
                * O Netinstall é importante para reinstalar routerboards por possíveis danos em 
                suas instalações. 
        
            Ir no site da Mikrotik --> Softwares --> General --> Netinstall;
                Nessa opção você poderá baixar o netinstall;
                    ESCLUSIVO DO WINDOWS!!!!!
                        O Mikrotik tem sua linha de comando baseada no Linux, mas o Netinstall é um 
                        software que só funciona em sistemas operacionais Windows, se sua máquina for 
                        Linux ou MAC, só será possível fazer com uma máquina virtual Windows.

            Na tela do netinstall, é possível fazer as configurações de IP, Gateway e etc.

            Instalação em infraestrutura, (Routerboard) 
                Precisará de um cabo conectado na porta Serial do equipamento em um PC ou Notebook.
                    Para dar certo, é necessário existir alguns parâmetros:
                        * 115.200 bps de velocidade;
                        * 8 bits de dados;
                        * 1 bit de paridade;
                        * Controle de fluxo;
            
            Ao entrar na routerboard selecione: 
                o - boot device 
                e em seguida 
                e - etherboot 

                Em alguns momentos, o cabo pode ser colocado na entrada USB, MAS ISSO DEPENDE MUITO DO HARDWARE
                EM QUESTÃO, normalmente é feito com cabo de rede e normalmente é plugado na porta Serial.
            
                    Você pode bootar de duas formas:
                        * A partir dos comandos mostrados;
                        * ir na parte física, pode ser uma placa mãe, normalmente existe um botão de boot loader,
                        é só apertar o botão.
                            Este procedimento fará o boot ser executado a partir do MAC address assim como nas placas de rede 
                            mais antigas, permitindo o Netinstall assumir a responsabilidade de instalação e novos pacotes.

                                Primeiro procedimento: Adicionar IP;
                                Segundo procedimento: Execute o aplicativo Netinstall a partir de seu 
                                computador;
                                Terceiro procedimento: Configure o endereço no netbooting, elas precisam estar na mesma subrede;
                                Quarto procedimento: Dê um boot (reinicie) seu Mikrotik com o botão bootloader apertado;
                                    CUIDADO PARA NÃO DANIFICAR O ROUTERBOARD.
                                Quinto procedimento: Selecione seu Mikrotik;
                                Sexto procedimento: Vá até a pasta que contém "Combined Packages" pacote combinado da versão escolhida 
                                do Mikrotik referente ao modelo de sua RB (Olhar a série), e marque o pacote.
                                Sétimo procedimento: Adicione o IP e Gateway e desmarque a opção keep old configuration, para não manter 
                                as configurações antigas.
                                Oitavo procedimento: Clique em instalar.
                                Nono procedimento: Após a mensagemd e Waiting Reboot ser exibida, significa que a routerboard estará aguardando 
                                ser reiniciada;
                                Décimo procedimento: Clique em Reboot e aguarde a conclusão da instalação até o beep duplo.
                                





