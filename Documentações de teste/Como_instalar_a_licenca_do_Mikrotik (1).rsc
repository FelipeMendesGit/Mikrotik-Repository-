Como instalar a licença do Mikrotik
    
    Desligar o WinBox 
        Na linha  de comando do Linux
            interface print 
                Para ver as interfaces 
    
        Primeiramente precisa-se colocar ip na interface 
            ip address add address= (TAB)
            ipconfig
            ip address add address=(Algum IP da range) netmask (máscara) 
            interface=ether1 
            ip address print 
        
    Acessar o WinBox
        Ir em Neighbors e ver o endereço MAC junto com o endereço ip configurado.
            Após acessar o WinBox, ele já vem a opção de ter a licença
                Ignorar a aba por enquanto, porque é possível mexer em algumas coisas 
                    System --> License --> Import Key --> Selecionar o arquivo 
                        Ele vai pedir para reiniciar, mas ele não irá funcionar, então 
                        deverá ir em New Terminal e escrever:
                            system reboot 
            
        Após reiniciar o sistema e reiniciar na linha de comando, digitar:
            system license print
                Em nlevel, ele deve aparecer 6 
                    Após reinicializar o Winbox e conectar, ele não irá mais pedir licença, porque ele 
                    já estará embutido no software.
                        Pingar o ip da máquina
                        

