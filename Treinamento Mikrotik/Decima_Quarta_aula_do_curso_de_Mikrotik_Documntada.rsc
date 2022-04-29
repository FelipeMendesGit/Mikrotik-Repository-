Décima Quarta aula do curso de Mikrotik

    Changelogs:
        São os tipos de implementações que são criados ou correções 
        adequadas para uma determinada versão.
            Para ver os changelogs, é só olhar no próprio site da Mikrotik.
                Na tradução literal seria: Histórico de alterações.
                    Também aparecem as informações relacionadas á mudanças 
                    de configuração ou qualquer outra coisa.

    Tipos de pacotes: 
        Main Package: contém um único pacote com a atualização padrão da versão,
        utilizado para atualizar o sistema inteiro de uma única.

        Extra Packages: contém todos os pacotes avulsos, inclusive os pacotes
        opcionais como user manager.

    Manipulação de Pacotes: 
        Existem pacotes que podem não ter sido instalados no momento da instalação 
        ou mesmo permanecerem desabilitados.
            Pacotes desabilitados aparecerão esmaecidos ou com um X na frente.
                Caso o pacote não esteja disponível (instalado), basta baixar o
                mesmo que será automaticamente instalado e em seguida habilitá-lo 
                caso esteja desabilitado por default.

        Eles são encontrados em Package List no Winbox, e na linha de comando é 
        só digitar /system package para ver os pacotes disponíveis e indisponíveis.

        Instalar os pacotes desabilitados:
            Ir no site da Mikrotik.
            Baixar o extra packages.
            Seleconar o pacote que você quer.
            Ir em Files no WinBox.
            Jogar o pacote para a Files list.
            Ir em System --> Reboot.
                Ou  seja, ele vai reiniciar o servidor.
                    Agora se você for em systema packages, elee vai estar com 
                    o pacote habilitado.
                        Se ele aparecer os pacotes como agendados para habilitar,
                        é só dar reboot no servidor que ele normalmente habilita.

    Atualização de nível de licença:
        Em System --> License: aparece a versão da licença, Software ID e Serial Numbers.
            É com o número do Software ID que você precisa para comprar a licença.

            Para implementar a licença você precisa comprá-la primeiro.

            Para não ter problema com esse número, apertar primeiramente o Export Key
                Ele irá jogar essa chave na sua área de trabalho.

            Ir em System --> License e importar a chave de licença qe você tem.

            Uma outra opção é abrir a chave em um arquivo de texto, copiar o código e 
            apertar em  Paste Key e ele vai sobrepor a licença que você tem.

    Backup e Restore:
        
        Backup:
        * Em Files, clique no botão Backup para gerar um arquivo.
        
        Restore: 
        * Em Files, copie o arquivo de backup arrastando-o para 
        dentro da janela via WinBox.
        * Selecione o arquivo a ser restaurado.
        * Clique no botão Restore.

            Restore: é o processo de recuperação e tratamento dos dados contidos 
            em mídias de armazenamento secundário danificadas, falhadas, corrompidas 
            ou inacessíveis quando ela não pode ser acessada normalmente.

                Backups de outros Hardwares ou versões, podem causar problemas em sua 
                restauração.

                    Se você for restaurar um backup, a primeira coisa que ele irá pedir É
                    a reinicialização.




