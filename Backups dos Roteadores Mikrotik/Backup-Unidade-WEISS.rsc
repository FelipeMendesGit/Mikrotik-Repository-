# feb/12/1970 23:40:06 by RouterOS 6.42.6
# software id = SE7Z-T8Y5
#
# model = 750
# serial number = 25B901A187AF
/interface bridge
add fast-forward=no name=Loopback
add admin-mac=00:0C:42:7C:DF:19 auto-mac=no comment=defconf name=bridge
/interface ethernet
set [ find default-name=ether1 ] comment="Interface de conex\E3o como LAGER"
set [ find default-name=ether2 ] comment="Interface de conex\E3o com SAISON"
/interface list
add comment=defconf name=WAN
add comment=defconf name=LAN
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=default-dhcp ranges=192.168.88.10-192.168.88.254
add name=dhcp_pool1 ranges=172.16.255.9
/routing ospf instance
set [ find default=yes ] redistribute-connected=as-type-1 \
    redistribute-other-ospf=as-type-1 router-id=172.16.255.253
/interface bridge port
add bridge=bridge comment=defconf interface=ether4
add bridge=bridge comment=defconf interface=ether5
/ip neighbor discovery-settings
set discover-interface-list=LAN
/interface list member
add comment=defconf interface=bridge list=LAN
add comment=defconf interface=ether1 list=WAN
/ip address
add address=10.100.100.224/23 comment=defconf interface=bridge network=\
    10.100.100.0
add address=172.16.255.10/30 interface=ether2 network=172.16.255.8
add address=172.16.255.13/30 interface=ether5 network=172.16.255.12
add address=172.16.255.253 interface=Loopback network=172.16.255.253
/ip dhcp-server network
add address=172.16.255.8/30 dns-server=0.0.0.0 gateway=172.16.255.10
add address=192.168.88.0/24 comment=defconf gateway=192.168.88.1
/ip dns
set allow-remote-requests=yes
/ip dns static
add address=192.168.88.1 name=router.lan
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1
add action=masquerade chain=srcnat2 out-interface=ether2
/ip route
add distance=1 gateway=10.100.100.5
/routing ospf interface
add interface=ether1 network-type=point-to-point
add cost=20 interface=ether2 network-type=point-to-point
add cost=20 interface=ether5 network-type=point-to-point
/routing ospf network
add area=backbone network=172.16.255.253/32
add area=backbone network=172.16.255.8/30
add area=backbone network=172.16.255.12/30
add area=backbone network=192.168.0.0/16
/system identity
set name=Weiss-
/system routerboard settings
set silent-boot=no
/tool mac-server
set allowed-interface-list=LAN
/tool mac-server mac-winbox
set allowed-interface-list=LAN
