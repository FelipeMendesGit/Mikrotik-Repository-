!TUTORIAL PARA CONFIGURAR O ROTEADOR MIKROTIK

WINBOX DO MIKROTIK
	
	Para fazer o protocolo funcionar primeiramente 
	faça o seguinte:
	
	Routing --> OSPF --> Instances

Precisa definir uma instancia de roteamento do OSPF.
Clicando duas vezes na default, vai abrie a tabela de configuração da
instancia.

    Por padrão vem default.

    Router ID: colocar o maior ip configurado na caixa.
	
Agora precisa informar ao OSPF as interfaces vão estar escutando o broadcast 
OSPF e quais svão fazer parte do processo do protocolo.
	 Na mesma tabela ir em:
		network --> + --> Adicionar o ip de uma rota -- Apply
			Exemplo ----> (Network: 192.168.12.0) -> Apply
                          (Network: 192.168.13.0) -> Apply
                            
    A Maneira Tradicional é fazer um por vez de maneira rápida.

    Voltando em Instances, ela deve estar como yes, porque ela já identificou as 
    interfaces que farão parte desse processo.

        FAZER O PROCESSO TODO EM TODOS OS ROUTERS.

    Acessar a linha de comando de cada roteador no putty
        Ver os IP's que foram associados:
            ip address print 

    Após ver se os ID's foram associados, pingar algum ip desse ID:
        Exemplo: ID: 192.168.23.0
        Deverá pingar 192.168.23.1 ou qualquer outro
        O comando de ping é igual aos outros
        Ambos devem estar pingando

    Para ver se deu tudo certo com a instancia:
        /routing ospf instance print
        Nesse comando, ele deverá mostrar o nome da instancia com algumas outras 
        informações.

    Para entrar no modo de configuração do roteamento OSPF
        /routing ospf network

    Fazer as seguintes configurações:
        add
        Vai estar no modo add

        network=192.168.0.0/16 area=backbone

    FEITO ISSO O PROTOCOLO VAI IDENTIFICAR AS INTERFACES QUE ESTÃO NESSE RANGE E A INSTANCIA
    OSPF DEVE SUBIR 

    Para sair de algum meio:
        ..

    Fazer o comando:
        ip address print

    Ele deve aparecer o endereço em ADDRESS e o ID em NETWORK.

    Ele sempre irá associar o maior ip da caixa de ip's

    Na tabela de rotas devem aparecer os ips de cada interface
        Para ver:
            IP --> Routes

    Já é possível verificar que o OSPF está funcionando juntamente com os ID's, 
    ele costuma aparecer como DAo.

    Também é possível ver em OSPF --> Routes
        Nessa versão é possível ver que ele consegue balancear a rota.

    Adicionar os ips que interligam a rota entre os roteadores para os computadores, 
    colocar de acordo com o ip que está na topologia.

        Routing --> OSPF --> Networks --> + --> adicionar o ip --> Apply.
        Fazer isso em todos de acordo com seus ips.

    Pingar os ips que acabaram de ser adicionados, ou seja, os ips da rota entre 
    os roteadores e computadores (Rede Local).
        Esse teste é necessário porque o computador também precisa ter acesso ás rotas.
        NÃO PINGAR O ID, PINGAR O PRIMEIRO IP VÁLIDO.

        Aquele roteador que está com duas rotas, (que provavelmente será todos), deverá alterar 
        o custo para 20, porque o custo já vem por padrão com 10.

            Routing --> OSPF --> (Clicar na interface que voce quer alterar) --> Copy 
            --> Cost=20 --> Apply.
        
        


    





                    