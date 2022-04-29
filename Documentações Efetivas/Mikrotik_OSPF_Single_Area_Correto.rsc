Mikrotik OSPF Single Area 
    
    As configurações serão feitas na linha de comando.

        Primeiramente precisamos configurar os endereços IP 
            Router IPA
                ip addresses add address=172.16.255.2 netmask 255.255.255.252 interface=ether2
                ip addresses add address=172.16.255.5 netmask 255.255.255.252 interface=ether3
                ip addresses add address=192.168.1.45 netmask 255.255.255.128 interface=ether1

            Router LAGER
                ip addresses add address=172.16.255.6 netmask 255.255.255.252 interface=ether2
                ip addresses add address=172.16.255.9 netmask 255.255.255.252 interface=ether3
                ip addresses add address=192.198.2.5 netmask 255.255.255.192 interface=ether1

            Router WEISS
                ip addresses add address=172.16.255.10 netmask 255.255.255.252 interface=ether2
                ip addresses add address=172.16.255.13 netmask 255.255.255.252 interface=ether3
                ip addresses add address=192.168.3.27 netmask 255.255.255.192 interface=ether1

            Router SAISON
                ip addresses add address=172.16.255.14 netmask 255.255.255.252 interface=ether2
                ip addresses add address=172.16.255.17 netmask 255.255.255.252 interface=ether3
                ip addresses add address=192.168.4.121 netmask 255.255.248.0 interface=ether1

        As informações gerais são configuradas em /routing ospf instance 
            Habilitar a instância padrão (Default Instance)
                /routing ospf instance
                add name=default 
                    Fazer exatamente a mesma configurações em todos os routers 
        
        Mostrar as informações da instância OSPF
            Pode fazer de duas formas:
                Se estiver no modo normal
                    routing ospf instance print 
                Se estiver no modo routing ospf instance 
                    print
            
            Deve aparecer essas informações
                Flags: X - disabled 
                 0   name="default" router-id=0.0.0.0 distribute-default=never 
                     redistribute-connected=as-type-1 redistribute-static=as-type-1 
                     redistribute-rip=no redistribute-bgp=no redistribute-other-ospf=no 
                     metric-default=1 metric-connected=20 metric-static=20 metric-rip=20 
                     metric-bgp=auto metric-other-ospf=auto in-filter=ospf-in 
                     out-filter=ospf-out

        Criar uma interface bridge:
            É recomendado usar a interface de loopback 
                interface bridge 
                add name=loopback 
            Sair do modo interface bridge = ..
            
            Adicionar ip na interface de loopback  
                
                Router IPA
                    ip address add address=172.16.255.255 netmask 255.255.255.255 interface=loopback
                    routing ospf instance 
                    set 0 router-id=172.16.255.255
                Router LAGER
                    ip address add address=172.16.255.254 netmask 255.255.255.255 interface=loopback
                    routing ospf instance 
                    set 0 router-id=172.16.255.254
                Router WEISS
                    ip address add address=172.16.255.253 netmask 255.255.255.255 interface=loopback 
                    routing ospf instance 
                    set 0 router-id=172.16.255.253
                Router SAISON
                    ip address add address=172.16.255.252 netmask 255.255.255.255 interface=loopback
                    routing ospf instance 
                    set 0 router-id=172.16.255.252
                
        Adicionar as redes na área de backbone 
            
            Router IPA 
                routing ospf network
                add network=IP da área bridge (Não é o de loopback) netmask (máscara desse ip) area=backbone
                add network=172.16.255.0 netmask 255.255.255.252 area backbone
                add network=172.16.255.4 netmask 255.255.255.252 area backbone
            Router LAGER 
                routing ospf network
                add network=IP da área bridge (Não é o de loopback) netmask (máscara desse ip) area=backbone
                add network=172.16.255.4 netmask 255.255.255.252 area backbone
                add network=172.16.255.8 netmask 255.255.255.252 area backbone  
            Router WEISS
                routing ospf network
                add network=IP da área bridge (Não é o de loopback) netmask (máscara desse ip) area=backbone
                add network=172.16.255.8 netmask 255.255.255.252 area backbone
                add network=172.16.255.12 netmask 255.255.255.252 area backbone
            Router SAISON
                routing ospf network
                add network=IP da área bridge (Não é o de loopback) netmask (máscara desse ip) area=backbone
                add network=172.16.255.12 netmask 255.255.255.252 area backbone
                add network=172.16.255.16 netmask 255.255.255.252 area backbone

        Verificas se as interfaces foram configuradas corretamente:
            /routing ospf interface
            print 
        
        Checar se os "Neighbors" do OSPF estão adjacentes e estabelecidos da maneira correta:
            /routing ospf neighbor 
            print

        Para verificar as rotas:
            ip route print

            

