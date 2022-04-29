Décima aula do curso Mikrotik Documentada.

    Formas de Acesso:

        Após a instalação do Mikrotik RouterOS, o seu equipamento precisará
        receber um endereço IP, pois o processo não é automático, portanto, 
        aos equipamentos que não trazem a configuração de seu endereço IP, é 
        necessário configurá-los manualmente.

            Tipos de Acesso:
            
            * Via Console
            * Via Terminal
            * Via Telnet MAC (acessado através de outro Mikrotik) 
            * Via WinBox 
            * Via Webfig 

    Primeiros Comandos:

        Acesso ás configurações por sistema de diretórios hierárquicos para 
        navegação por digitação:

            Para entrar no modo de configurção de IP
                [admin@Mikrotik]> ip
                [admin@Mikrotik] ip > address
                [admin@Mikrotik] ip address >
                    
                Você também pode só escrever ip address que ele entra.
            
            Para sair de algum modo:
                ..
            
            Para voltar ao diretório raiz:
                /
            
            Para abrir o manual de ajuda:
                ?
            
                Se quiser saber informações específicas, deve colocar o assunto + ?
                    interface?
                
            Tecla TAB
                Os comandos não precisam ser totalmente digitados podendo ser 
                completados com a tecla TAB: 
                    inter[TAB] 
                    interface

            O comando print mostra as informações da configuração disponíveis 
            em cada pasta: 
                Exemplo: interface ethernet print 
                    Você pode fazer direto ou passo a passo
                
                Se quiser mais detalhes é só adicionar detail:
                    Exemplo: interface ethernet print detail 

            Mostrar o estado real de uma interface:
                Exemplo: [admin@Mikrotik]> interface monitor ether1
                            status: link-ok
                                  auto-negotiation: done 
                                  rate: 100Mbps
                                  full-duplex: yes 
                            default-cable-setting: standard 

                                Status: ele vai mostrar se ele tem conectividade 
                                    Principalmente com ip.
                                Auto-negotiation: Se a negociação de ips está automática.
                                    Esse está relacionado com o status.
                                rate: tempo em que ele faz os processos.
                                full-duplex: É o modo de transmissão em sentido duplo ou 
                                bidirecional simultâneo.
                                    Ele pode receber e enviar informações ao mesmo tempo.
                                default-cable-setting: tipo de configuração padrão de cabo.
                                    Tipo do cabo, o exemplo acima é o standard.
                                
                                 

