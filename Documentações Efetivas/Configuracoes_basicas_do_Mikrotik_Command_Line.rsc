Configurações básicas do Mikrotik Command Line
    Todas as configurações serão feitos na linha de comando

        Colocar o nome do usuário
            O comando /user print mostra todos os usuários 
                Para alterar:
                    Router IPA
                        /user set 0 name=UNIDADE IPA
                    Router LAGER 
                        /user set 0 name=UNIDADE LAGER
                    Router WEISS
                        /user set 0 name=UNIDADE WEISS
                    Router SAISON 
                        /user set 0 name=UNIDADE SAISON 
            
        Se não der certo, colocar dessa forma:
            system identity set name=Nome do equipamento.
        
        Para colocar uma senha:
            Router IPA
                /user set 0 password=S3n@1Project2022CTI 
                    Senha igual para todos os routers
                
        Renomear as interfaces:
            interface ethernet set name=internet numbers=0
            interface ethernet set name=rede numbers=1
                Fazer isso em todos os routers
        
        Liberar o Cliente DHCP:
            ip dhcp-cliente add interface=internet disabled=no 
                Fazer isso em todos os routers
        
        Adicionar o endereço na interface:
            ip address add address=192.168.1.1 netmask 255.255.255.128 interface=rede 
                Fazer isso em todos os routers
        
        Configurar o Servidor DHCP:
            ip dhcp-server setup 
                dhcp server interface: rede
                    Vão aparecer algumas informações, deixar como padrão mesmo.
                        Apenas dar ENTER
                
        Criar o Mascaramento do IP do NAT, Link NAT
            ip firewall nat add chain=srcnat action=masquerade 
                Fazer isso em todos os routers
                
        Tentar pingar o google por nome:
            ping google.com
                Deve pingar.





            

        
                
            
