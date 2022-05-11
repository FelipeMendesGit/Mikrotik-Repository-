Módulo 2 do Curso Azure, primeiras aulas.

    Regiões
        O Azure oferece mais regiões globais do que qualquer
        outro provedor de nuvem, com mais de 60 regiões 
        representando mais de 140 países.

        As regiões são compostas por um ou mais data centers próximos.
        Fornece flexibilidade e escala para reduzir a latência do cliente.
        Preserva a residência de dados com uma oferta abrangente de conformidade.
    
    Pares de regiões
        • Pelo menos 300 milhas de separação entre pares de regiões.
        • Replicação automática para alguns serviços.
        • Prioriza a recuperação da região em caso de paralisação.
        • As atualizações são distribuídas sequencialmente para minimizar 
        o tempo de inatividade. 
    
            Há três Zonas de Disponibilidade por região do Azure com suporte. 
                Cada zona de disponibilidade tem uma rede, resfriamento e fonte de energia distintos. 
                Ao arquitetar suas soluções para usar VMs replicadas em zonas, você pode proteger 
                seus aplicativos e seus dados contra a perda de um data center.

    Zonas de disponibilidade
        • Fornece proteção contra o tempo de
        inatividade devido à falha no datacenter.
        • Datacenters fisicamente separados dentro
        da mesma região.
        • Cada data center é equipado com energia
        independente, resfriamento e rede.
        • Conectado através de redes privadas de
        fibra óptica.

    Recursos Azure
        Os recursos do Azure são componentes como armazenamento, máquinas virtuais e redes
        disponíveis para construir soluções em nuvem.

    Grupos de recursos
        Um grupo de recursos é um contêiner para
        gerenciar e agregar recursos em uma única
        unidade. 
            • Os recursos podem existir em apenas um grupo de recursos. 
            • Os recursos podem existir em diferentes regiões. 
            • Os recursos podem ser transferidos para diferentes grupos de 
            recursos. 
            • Os aplicativos podem utilizar vários grupos de recursos.

    Gerente de Recursos do Azure
        O ARM (Azure Resource Manager), gerenciador de recursos do Azure, fornece uma
        camada de gerenciamento que permite criar, atualizar e excluir recursos na sua
        assinatura do Azure.

    Azure Subscriptions
        Uma assinatura do Azure fornece acesso autenticado e autorizado às contas do Azure.
            
            • Limite de faturamento: gerar relatórios de faturamento separados e faturas 
            para cada assinatura.
            
            • Limite de controle de acesso: gerencia e controla o acesso aos 
            recursos que os usuários podem prover com assinaturas específicas.

    Management Groups – Grupos de Gerenciamento
        • Grupos de gerenciamento podem incluir várias assinaturas do Azure.
        • As assinaturas herdam as condições aplicadas ao grupo de gestão.
        • 10.000 grupos de gestão podem ser suportados em um único diretório.
        • Uma árvore de grupo de gerenciamento pode suportar até seis níveis de
        profundidade.

    Serviços de computação do Azure
        O Azure compute é um serviço de computação sob demanda que fornece
        recursos de computação como discos, processadores, memória, rede e
        sistemas operacionais.

    Máquinas Virtuais Azure
        As Máquinas Virtuais Azure (VM) são emulações de software de computadores físicos.
            • Inclui processador virtual, memória, armazenamento e rede.
            • Oferta IaaS que fornece controle total e personalização. 
        
    Azure App Services – Serviços de aplicativos do Azure
        O Azure App Services é uma plataforma totalmente gerenciada para construir,
        implantar e dimensionar aplicativos web e APIs rapidamente.
            • Funciona com .NET, .NET Core, Node.js, Java, Python ou php.
            • PaaS oferecendo com requisitos de desempenho, segurança e
            conformidade de nível corporativo. 

    Azure Container Services - Serviços de contêineres Azure
        Os Contêineres Azure são um ambiente virtualizado leve que não requerem
        gerenciamento de sistemas operacionais e podem responder às mudanças sob
        demanda.
            
            • Azure Container Instances: uma oferta PaaS que executa um
            contêiner no Azure sem a necessidade de gerenciar uma máquina
            virtual ou serviços adicionais.
            
            • Azure Kubernetes Service: um serviço de orquestração para
            contêineres com arquiteturas distribuídas e grandes volumes de
            contêineres.
    
    Windows Virtual Desktop
        O Windows Virtual Desktop é uma virtualização de desktop e aplicativo que é
        executada na nuvem.
            • Cria um ambiente completo de virtualização de desktop sem ter que executar
            servidores gateway adicionais.
            • Publica pools de host ilimitados para acomodar cargas de trabalho diversas.
            • Reduz custos com recursos agrupados e multi-session. 

    Serviços de Rede do Azure
        Azure Virtual Network (VNet) - permite que os recursos do
        Azure se comuniquem entre si, a internet e as redes locais.
        
        Virtual Private Network Gateway (VPN) - é usado para
        enviar tráfego criptografado entre uma rede virtual do
        Azure e uma rede local utilizando a internet pública.
        
        Azure Express Route - estende redes locais para o Azure
        por uma conexão privada que é facilitada por um provedor
        de conectividade.

    Serviços de armazenamento Azure
        Container storage (blob) - é otimizado para armazenar
        grandes quantidades de dados não estruturados como
        texto ou dados binários.
        
        Disk storage - fornece discos para máquinas virtuais,
        aplicativos e outros serviços de acesso e uso.
        
        Azure Files - configura um conjunto de compartilhamentos
        de arquivos de rede altamente disponíveis que podem ser
        acessados usando o protocolo SMB (Server Message Block
        - bloco de mensagens do servidor padrão).

    Azure storage access tiers - Níveis de acesso ao armazenamento do Azure
        Hot 
        Otimizado para armazenar dados que são acessados com frequência.
        
        Cool 
        Otimizado para armazenar dados que são acessados e
        armazenados com frequência por pelo menos 30 dias.
        
        Archive
        Otimizado para armazenar dados raramente acessados
        e armazenados por pelo menos 180 dias com requisitos
        flexíveis de latência.
    
    Azure database services
        Azure Cosmos Database - é um serviço de banco de dados distribuído globalmente
        que escala de forma elástica e independente o “throughput” (taxa de transferência) e o
        armazenamento. 
        
        Azure SQL Database - é um banco de dados relacional como um serviço (DaaS)
        baseado na versão estável mais recente do mecanismo de banco de dados Microsoft SQL Server.

        Azure Database for MySQL - é um serviço de banco de dados MySQL totalmente gerenciado para 
        desenvolvedores de aplicativos.

        Azure Database for PostgreSQL - é um serviço de banco de dados relacional
        baseado no mecanismo de banco de dados Postgres de código aberto.

    Azure SQL Managed Instance
        Azure SQL Managed Instance permite que os clientes existentes do SQL Server
        levantem e mudem seus aplicativos locais para a nuvem com alterações
        mínimas nos aplicativos e bancos de dados.
            • Totalmente gerenciada e Plataform Evergreen como um serviço.
            • Preserva todos os recursos do PaaS (patches automáticos e atualizações 
            de versão, backups automatizados e alta disponibilidade).
            • Troque as licenças existentes para conseguir descontos na instância gerenciada 
            do SQL usando o Azure Hybrid Benefit.

    Azure Marketplace
        O Azure Marketplace permite que os clientes encontrem, experimentem,
        comprem e provisionem aplicativos e serviços de centenas de provedores de
        serviços líderes, todos certificados para serem executados no Azure.
            • Plataformas de contêineres de código aberto.
            • Imagens de máquina virtual e banco de dados.
            • Software de construção e implantação de
            aplicativos.
            • Ferramentas de desenvolvedores.
            • E muito mais, com mais de 10.000 anúncios!

    