Script linha de comando IPv6 OSPF

OS ENDEREÇOS IP SÃO APENAS DE EXEMPLO.

USAR O SCRIPT DE EXEMPLO, POIS NA TOPOLOGIA ORIGINAL TEM 5 ROTEADORES. 

Roteador 1

	/ipv6 address add address=2001:db8:1::1/64 interface=ether1 advertise=yes

	/ipv6 address add address=2001:db8:10::1/64 interface=ether5 advertise=no

	/ipv6 address add address=2001:db8::1/128 interface=loopback advertise=no

	/routing ospf-v3 interface add interface=ether1 area=backbone

	/routing ospf-v3 interface add interface=ether5 area=backbone

	/routing ospf-v3 interface add interface=loopback area=backbone

	/routing ospf-v3 instance set redistribute-connected=as-type-1 default

	/routing ospf-v3 instance set redistribute-connected=as-type-1 default

	/routing ospf-v3 instance set router-id=0.0.0.1 default

Roteador 2
	
	/ipv6 address add address=2001:db8:10::2/64 interface=ether1 advertise=no

	/ipv6 address add address=2001:db8:11::1/64 interface=ether5 advertise=no

	/ipv6 address add address=2001:db8::2/128 interface=loopback advertise=no

	/routing ospf-v3 interface add interface=ether1 area=backbone

	/routing ospf-v3 interface add interface=ether5 area=backbone

	/routing ospf-v3 interface add interface=loopback area=backbone

	/routing ospf-v3 instance set redistribute-connected=as-type-1 default

	/routing ospf-v3 instance set redistribute-connected=as-type-1 default

	/routing ospf-v3 instance set router-id=0.0.0.2 default

Roteador 3 

	/ipv6 address add address=2001:db8:11::2/64 interface=ether1 advertise=no

	/ipv6 address add address=2001:db8:2::1/64 interface=ether5 advertise=yes

	/ipv6 address add address=2001:db8::3/128 interface=loopback advertise=no

	/routing ospf-v3 interface add interface=ether1 area=backbone

	/routing ospf-v3 interface add interface=ether5 area=backbone

	/routing ospf-v3 interface add interface=loopback area=backbone

	/routing ospf-v3 instance set redistribute-connected=as-type-1 default

	/routing ospf-v3 instance set redistribute-connected=as-type-1 default

	/routing ospf-v3 instance set router-id=0.0.0.3 default



