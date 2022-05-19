# jan/21/1970 01:40:49 by RouterOS 6.49
# software id = KZLF-WSNM
#
# model = 750
# serial number = 2F2D01329E06
/interface bridge
add name=Loopback
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=172.16.255.13
/routing ospf instance
set [ find default=yes ] redistribute-connected=as-type-1 \
    redistribute-other-ospf=as-type-1 router-id=172.16.255.252
/interface list member
add interface=ether5
/ip address
add address=10.100.100.225/23 interface=ether5 network=10.100.100.0
add address=172.16.255.14/30 interface=ether5 network=172.16.255.12
add address=172.16.255.17/30 interface=ether1 network=172.16.255.16
add address=172.16.255.252 interface=Loopback network=172.16.255.152
/ip dhcp-server network
add address=172.16.255.12/30 dns-server=0.0.0.0 gateway=172.16.255.14
/ip firewall mangle
add action=change-ttl chain=prerouting disabled=yes new-ttl=set:16 \
    passthrough=yes
/ip firewall nat
add action=masquerade chain="NAT Link- MATRIZ" out-interface=ether5
add action=masquerade chain="NAT Link-WEISS" out-interface=ether2
/ip route
add distance=1 gateway=10.100.100.5
/routing ospf interface
add cost=20 interface=ether2 network-type=point-to-point
add cost=20 interface=ether5 network-type=point-to-point
add interface=Loopback network-type=broadcast passive=yes
add interface=ether1 network-type=point-to-point
/routing ospf network
add area=backbone network=172.16.255.12/30
add area=backbone network=172.16.255.16/30
add area=backbone network=172.16.255.252/32
add area=backbone network=192.168.0.0/16
/system identity
set name=SAISON
