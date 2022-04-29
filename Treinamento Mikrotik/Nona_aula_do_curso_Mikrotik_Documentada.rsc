Nona aula do curso Mikrotik Documentada 

    Procedimentos do Netinstall
        Primeiramente precisa-se ter algum aplicativo para acessar o 
        aparelho para iniciar as configurações.
            Exemplo: PuTTy, Hercules e etc.
        
        Aqui está uma demonstração pelo Hercules.
        
            Na tela de entrada, você deve informar o nome da porta Serial,
            normalmente é a COM4, mas para ver no computador é só ir em:
                Gerenciador de dispositivos --> Portas --> Prolific USB-to-Serial -->
                COMM port.
        
            Após isso em Baud, informar a velocidade, informar a maior que é 115200.

            Data size pode deixar como padrão.

            Em Party deixar como none, não é necessário especificar o tipo de paridade.

                Apertar em Open
                    Ele irá abrir a sessão.
                        Você deve desligar o cabo de energia do aparelho, com isso ele 
                        vai continuar conectado, porém é necessário conectar novamente  
                        para energizar o aparelho, isso acontece porque quando ele 
                        entra já com o cabo de energia ligado, ele não reconhece a 
                        sessão direito, então desconectando e conectando em seguida 
                        ele reconhece perfeitamente.

                            Ele irá ligar uma tela com algumas informações do aparelho.
                            
                            Você tem dois segundos para clicar em qualquer tecla para 
                            entrar na tela de setup.

                            Em seguida, aparece algumas opções para dar reboot no equipamento,
                            mas se você não clicar em nenhum, ele irá reiniciar automaticamente.

                            Se for escolher alguma, clicar na letra o.
                                Se quiser voltar para escolher outro, clicar na letra n.
                            
                        FORMA MAIS USADA!!!!!
                            Entrar no aparelho;
                            Clicar em qualquer tela para entrar;
                            Na primeira tela, clicar a letra o = boot device;
                            Na segunda tela, clicar a letra e = boot over ethernet;
                            Ele volta para a primeira tela, clicar em x para sair e
                            reiniciar;
                        
                                Indo no netinstall, ele deverá reconhecer o aparelho.
                                    Selecionar o equipamento e ir em network booting settings
                                        Colocar um ip na mesma sub-rede que o computador.
                                            Exemplo: No computador: 192.168.88.2
                                                     No net booting: 192.168.88.5 
                                                Não precisa colocar máscara.
                                                    Agora será possível fazer as configurações.
                                                        Em IP address colocar o primeiro ip válido da
                                                        sub-rede, seguindo o mesmo exemplo, seria 
                                                        192.168.88.1, escolher a máscara, ppor exemplo 
                                                        /24.
                                                            Ele automaticamene irá adicionar esse ip na 
                                                            interface ether1, você também pode escolher um 
                                                            gateway e toda vez que o aparelho for reinicializado 
                                                            ele vai ligar com esse gateway.
                                                        
                                                        Em from, apertando em browser, você irá escolher na pasta 
                                                        um pacote combinado.
                                                            É possível instalar o All packages, com isso você pode escolher
                                                            o pacote que você queira, mas é mais prático escolher o pacote
                                                            combinado 
                                                                O grande problema de escolher individualmente:
                                                                    Exemplo: Eu escolho só o de sistema, com isso ele só vai instalar 
                                                                    o básico do básico sem nenhum tipo de pacote diferente, muitas 
                                                                    vezes necessário, após desligar o aparelho, quando ele for ligado 
                                                                    novamente, o equipamento vai atribuir isso como padrão.
                                                                        Isso acontece mesmo se eu instalar novos pacotes manualmente.
                                                                            Selecionando o pacote escolhido, apertar em instalar.
                                                                                Após instalar, ele vai pedir reboot.
                            
                                            No Hercules, ele vai aparecer aquela tela  novamente, seguir como padrão, porém na segunda tela, 
                                            escolher a letra n = boot from NAND, if fail then Ethernet.
                                                Apertar x
                                                    Agora ele vai prosseguir com a configuração correta do aparelho. 
                                            
                                             A Porta Lógica NAND (Não E) é uma porta lógica que possui no mínimo duas entradas, e cujo valor 
                                             lógico em sua saída será igual a 0.

                                                FINALMENTE A TELA DE LOGIN IRÁ APARECER CERTINHO PARA CONFIGURAÇÕES COM TODOS OS PACOTES!!!!

                                            Para avisar a situação da instalação ele manda beeps.
                                                Beep na informática, é uma mensagem de texto contendo alguma informação.
                                                    Se ele mandar um beep, significa que começou o processo de instalação, se ele der beep 
                                                    duplo, significa que a instalação foi concluída.
                                            
                                            Interface print     
                                                Comando para ver as interfaces.
                                            
                                            Colocando o ip atribuído no WinBox, no caso do exemplo: 192.168.88.1, ele irá acessar as configurações 
                                            do Mikrotik pelo software de interface gráfica.
                                                Em interfaces list, é possível ver as interfaces disponíveis e escolhidas.
                                                    Por padrão as interfaces Wireless são desabilitadas, mas é possível habilitá-las
                                                    Alguns pacotes também vem desabilitados mesmo após instalados, como por exemplo o IPv6,
                                                    mas existe um procedimento para habilitá-los.
                                                
                Como fazer sem o Cabo Serial???
                    Ir na placa, e no canto normalmente tem o botão de boot loader.
                    Deixar conectado o cabo de rede.
                    Segurar levemente e deixar pressionado por ele ser sensível
                        Cuidado para não romper.
                    E conectar o cabo de energia.
                        Só soltar o boot loader quando ele reconhecer o aparelho no netinstall.
                    
                            A instalação de pacotes é a mesma.
                        
                        


                                                        
                                                        
                                                         

                                                        




                            





        

            
