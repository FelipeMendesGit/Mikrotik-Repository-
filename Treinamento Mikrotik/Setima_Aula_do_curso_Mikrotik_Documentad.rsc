Sétima Aula do curso Mikrotik Documentada.

    Instalação via CD
        O Mikrotik RouterOS pode ser instalado utilizando:
            
            * CD "bootável" (gerado a partir de uma imagem ISO); 
            * Aplicativo Netinstall (Instalação via Serial/Rede);
            
        Quando se fala em instalação via CD no Mikrotik, pode ser 
        tanto um CD físico quanto uma imagem de disco óptico 
        (Virtualizada).

        No próprio site da Mikrotik:
            Software --> Downloads.

                * Main Package: Pacote combinado para atualização completa;
                    Essa versão vem os pacotes padrões do sistema, inclusive
                    na hora de escolher os pacotes que você escolheria, aparece 
                    apenas System, que vem todos os pacotes necessários para a 
                    configuração do Mikrotik.

                * Extra Packages: Todos os pacotes individuais, inclusive pacotes opcionais. 
                Utilizado para instalação independente;
                    Essa versão vem os pacotes para você escolher individualmente, com isso
                    vem também alguns pacotes opcionais com um caráter mais personalizado que
                    não vem em uma arquitetura padrão.

                CD Image: Arquivo de imagem para a instalação da arquitetura Mikrotik
                    É um arquivo que deve ser baixado para a instalação do sistema 
                    operacional, ela pod funciionar tanto para uma compactação em um CD 
                    físico tanto para uma virtualização.
                
        No arquivo de instalação, OVA por exemplo, fazer download do arquivo de imagem da versão
        desejada.
            Procure instalar a versão que seja homologada (Stable) estável do routerOS, isso porque 
            ela foi analisada e testada com sucesso pela empresa para o uso.
        
        Imagem VMDK OU VHDX: HD Virtual.

        O "CD-install" permite instalar o Mikrotik RouterOS em arquitetura x86 que não é o caso das 
        routerboards, que necessitam do aplicativo Netistall.

            Pré-requisitos para instalação Via CD em um PC 
                
                * Equipamento de arquitetura x86;
                * Disco rígido instalado;
                * 2 ou mais Placas de rede (compatível com o routerOS) consultar a lista;
                * Unidade de CD-ROM 
                * CD Instalador, gerado a partir da imagem baixada do site com a versão desejada;

                    CD ROM: Disco compacto, funciona também no disco óptico virtual;

                        Se o Mikrotik reconhcer seu HD, aparecerá a tela de reconhecimento.

                        Se foi instalado a versão "Main package", ele só irá aparecer System, dentro dele 
                        estarão os pacotes padrões compactados então é só apertar a letra I.

                        Se foi instalado a versão "Extra package", você deverá escolher os pacotes antes de 
                        continuar, dentro dele, você poderá escolher outros pacotes fora do padrão.

                            Ele vem com essas perguntas:

                                Do you want to keep old configuration?
                                Warning: all data on the disk will be erased!
                                Continue?
                                    Aceitar todas apertando y.
                                        Ele vai fazer uma partição com os pacotes escolhidos.
                                            Após continuar, ele vai reiniciar e formatar o sistema operacional.
                                        
                                        Se for um equipamento físico, ele vai cair na tela de login, colocar o usuário admin 
                                        e a senha em branco.
                                            
                                            Porém se for uma máquina virtual, ele tem um problema crônico de disco, então após 
                                            reiniciar ele vai voltar na seleção de pacotes novamente. Para resolver o problema,
                                            é só ir na parte física de seu virtualizador ir em armazenamento e remover a ISO 
                                            do Mikrotik porque ela já está embutida, quando a máquina ligar, rlr vai cair na tela
                                            de login.

         

                                                         


            

