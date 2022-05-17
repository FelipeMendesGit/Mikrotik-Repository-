Backup no Mikrotik.

    Ir em files, vai ter uma opção de backup.

        Clicando em backup tem o nome e a senha desse backup:
            Eles colocaram criptografado por padrão, mas se não 
            quiser tema opção "Don't Encrypt" para não criptografar, 
            porém ele não dará direito a senha.

                Com o Backup criado, é só arrastá-lo para a área de 
                trabalho.
            
                    Guardar em algum outro lugar, como email por exemplo.

        Para restaurar um backup, precisa selecionar um arquivo e clicar 
        em restore e colocar a senha correta.

            Também é possível exportar um backup por linha de comando:
                export file=BackupMikrotikTexto 
                    O nome é um exemplo.

            Também é possível exportar uma configuração específica:
                Exemplo: eu quero exportar apenas as configurações do IP address:
                            ip address 
                            export file=IP

                    Com isso ele vai criar um backup com apenas as configurações de IP 

                        Se as configurações não foram especificadas, ele faz um backup de todo 
                        equipamento.

                            O padrão das configurações em linha de comando é em .rsc, ou seja, 
                            na linha de comando ele vai salvar o backup no modelo script e o 
                            Windows por padrão não consegue reconhecer como um texto que possa 
                            ser lido.

                                Para abrí-lo no seu Windows:
                                    Clicar no botão direito --> Abrir com --> Selecionar o bloco de 
                                    notas.
                                        Ele vai abrir o script no bloco de notas.

                                            No backup modo script, linha de comando, ao abrir no bloco de
                                            notas, você pode apagar linhas de configurações que você não quer

                                            Se for feita alguma alteração no script, salvar o documento e colocar 
                                            na lista de backups do Mikrotik. 
                                        
                                            Existem duas maneiras de importar um backup:
                                                System --> Scripts --> Adicionar o script no espaço em branco.

                                                Ir na linha de comando:
                                                    import file=Nome do backup 
                                                        Se der um TAB, ele vai completar.
                                                    Também pode copiar e colar o script para uma cópia.
                                                        Se tiver alguma configuração errada ele aparece em vermelho.

                                                


        
    

