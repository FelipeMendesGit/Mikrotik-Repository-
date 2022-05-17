# may/17/2022 13:48:39 by RouterOS 6.49.6
# software id = UI2K-5LEB
#
# model = 750
# serial number = 2F2D010B2FEF
/interface bridge
add name=Loopback
/interface ethernet
set [ find default-name=ether1 ] comment=\
    "Interface conectada ao router Matriz"
set [ find default-name=ether2 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full comment=\
    "Interface conectada ao router LAGER"
/interface vlan
add interface=ether4 name=vlan10 use-service-tag=yes vlan-id=10
/interface list
add comment=defconf name=WAN
add comment=defconf name=LAN
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=default-dhcp ranges=192.168.88.10-192.168.88.254
add name=VPN ranges=172.16.255.1-172.16.255.254
/ppp profile
set *FFFFFFFE local-address=172.16.255.2 remote-address=VPN
/routing ospf instance
set [ find default=yes ] redistribute-connected=as-type-1 \
    redistribute-other-ospf=as-type-1 router-id=172.16.255.255
/ip neighbor discovery-settings
set discover-interface-list=LAN
/interface l2tp-server server
set authentication=chap,mschap1,mschap2 enabled=yes ipsec-secret=Senai@132 \
    use-ipsec=required
/interface list member
add comment=defconf list=LAN
add comment=defconf interface=ether1 list=WAN
/ip address
add address=10.100.100.222/23 comment=defconf interface=ether5 network=\
    10.100.100.0
add address=172.16.255.2/30 interface=ether1 network=172.16.255.0
add address=172.16.255.5/30 interface=ether5 network=172.16.255.4
add address=172.16.255.255 interface=Loopback network=172.16.255.255
add address=192.168.1.1/25 interface=ether5 network=192.168.1.0
/ip cloud
set ddns-enabled=yes
/ip dhcp-server network
add address=172.16.255.0/30 dns-server=172.16.255.254 domain=Matriz.local \
    gateway=172.16.255.254 netmask=30
add address=192.168.88.0/24 comment=defconf gateway=192.168.88.1
/ip dns
set allow-remote-requests=yes servers=172.16.255.254
/ip dns static
add address=192.168.88.1 comment=defconf name=router.lan
/ip firewall filter
add action=accept chain=input protocol=ipsec-esp
add action=accept chain=input port=1701,500,4500 protocol=udp
/ip firewall nat
add action=masquerade chain=srcnat comment="NAT Link para Matriz" \
    out-interface=vlan10
add action=masquerade chain=srcnat2 comment="NAT Link para LAGER" \
    out-interface=ether2
/ip route
add distance=1 gateway=10.100.100.5
/ppp secret
add name=Teste password=Senai@132 profile=default-encryption service=l2tp
/routing ospf interface
add authentication=simple cost=20 interface=ether1 network-type=\
    point-to-point
add cost=20 interface=ether2 network-type=point-to-point
add cost=20 interface=ether4 network-type=point-to-point
add interface=ether5 network-type=point-to-point
/routing ospf network
add area=backbone network=172.16.255.255/32
add area=backbone network=172.16.255.0/30
add area=backbone network=172.16.255.4/30
/system clock
set time-zone-name=America/Sao_Paulo
/system identity
set name=IPA-
/tool mac-server
set allowed-interface-list=LAN
/tool mac-server mac-winbox
set allowed-interface-list=LAN
