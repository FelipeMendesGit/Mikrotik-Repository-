Verificar essas configurações para o funcionamento do OSPF
    
    Antes de tudo, fazer as configurações básicas e as configuraço~es de OSPF nos outros roteadores para não atrasar.
    
        Ver oque deu errado

            Olhar em Neighbors
                Selecionar a interface que quer ver em Interface List --> IP --> Neighbors
                    Normalmente aparece os routers que aquele roteador está associado
                        é para aparecer um que serve de gateway que seria a ether1 (olhar isso urgentemente), uma interface com
                        e cada interface em seu router específico
                            Se estiver conectada corretamente, comentar as interfaces para não esquecer suas funções.

            Em Neighbor List do outro router é pra aparecer os roteadores vizinhos
                Em IP addresses, endereçar essa interface
                    IP --> Addresses --> + --> Colocar o IP VÁLIDO NÃO O ID --> Escolher a mesma interface que
                    estava escrito na tabela.

            Se não tiver nada em Neighbors
                Na tabela de Neighbors --> Discovery Interfaces --> Habilitar ou Desabilitar as interfaces que quiser.
                    Ir em Tools --> MAC Server --> Desabilitar o all --> adicionar a interface habilitada.
                        Tentar fazer isso também em todas as interfaces que serão ligadas aos outros routers.

            Comentar as interfaces que estão plugadas nos routers
                Na tese, eu já conseguiria pingar os roteadores vizinhos, fazendo esse processo nas duas interfaces de cada router
                    Exemplo: Se estiver configurando o roteador IPA, deverá fazer esse processo na interface desse router
                    que está conectado com o Matriz e Lager.

            OLHAR PARA VER SE TÁ NA INTERFACE CORRETA, SE NÃO VAI DAR TIMEOUT DE QUALQUER JEITO!!!!!

            SE FUNCIONAR, FAZER ESSE PROCESSO EM TODOS!!!!

            O DO MAC, SÓ É FEITO SE NÃO TIVR NADA NA NEIGHBORS LIST!!!!!

            NA TESE, OS ROTEADORES CONFIGURADOS, JÁ CONSEGUEM SE COMUNICAR!!!!!

            SE MESMO ASSIM NÃO DER CERTO, AÍ EU JÁ NÃO SEI O QUE FAZER 


        

        