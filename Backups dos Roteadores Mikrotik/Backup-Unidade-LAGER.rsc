# jan/08/1970 21:46:18 by RouterOS 6.49
# software id = 32BM-RE1Z
#
# model = RouterBOARD 750 r2
# serial number = 67D207329FFD
/interface bridge
add name=Loopback
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip hotspot profile
set [ find default=yes ] html-directory=hotspot
/routing ospf instance
set [ find default=yes ] redistribute-connected=as-type-1 \
    redistribute-other-ospf=as-type-1 router-id=172.16.255.254
/ip address
add address=10.100.100.223/23 interface=ether5 network=10.100.100.0
add address=172.16.255.6/30 interface=ether5 network=172.16.255.4
add address=172.16.255.9/30 interface=ether2 network=172.16.255.8
add address=172.16.255.254 interface=Loopback network=172.16.255.254
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1
add action=masquerade chain=srcnat2 out-interface=ether2
/ip route
add distance=1 gateway=10.100.100.5
/routing ospf interface
add interface=ether1 network-type=point-to-point
add interface=ether2 network-type=point-to-point
add interface=ether5 network-type=point-to-point
/routing ospf network
add area=backbone network=172.16.255.4/30
add area=backbone network=172.16.255.8/30
add area=backbone network=172.16.255.254/32
add area=backbone network=192.168.0.0/16
/system identity
set name=LAGER
