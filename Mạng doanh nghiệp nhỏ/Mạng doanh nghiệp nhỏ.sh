
1. Sw Access1
ena
conf t
vlan 10
vlan 20
exit
inter e0/1
switchport mode acc
switchport acc vlan 10
inter e0/0
switchport mode acc 
switchport acc vlan 20
exit
inter range e0/2-3
switchport trunk encapsulation dot1q
switchport mode trunk
exit
spanning-tree mode mst
spanning-tree mst configuration
instan 1 vlan 10
instan 2 vlan 20
exit
inter range e0/0-1
spanning-tree portfast edge
spanning-tree bpduguard enable
exit

2. Sw Access2

ena
conf t
vlan 10
vlan 20
exit
inter e0/0
switchport mode acc
switchport acc vlan 10
inter e0/1
switchport mode acc
switchport acc vlan 20
inter range e0/2-3
switchport trunk encapsulation dot1q
switchport mode trunk
exit
spanning-tree mode mst
spanning-tree mst configuration
instan 1 vlan 10
instan 2 vlan 20
exit
inter range e0/0-1
spanning-tree portfast edge
spanning-tree bpduguard enable

3. Core switch1

ena
conf t
vlan 10
vlan 20
exit
inter vlan 10
no shut
ip add 192.168.10.100 255.255.255.0
standby 1 ip 192.168.10.254
standby 1 priority 150
standby 1 preempt
exit
inter vlan 20
no shut
ip add 192.168.20.100 255.255.255.0
standby 2 ip 192.168.20.254 
exit
inter e0/3
no switchport
no shut
ip add 10.10.1.1 255.255.255.0
exit
ip routing
router ospf 10
network 192.168.10.0 0.0.0.255 area 0
network 192.168.20.0 0.0.0.255 area 0
network 10.10.1.0 0.0.0.255 area 0
exit


4.Core switch2

ena
conf t
vlan 10
vlan 20
exit
inter vlan 10
no shut
ip add 192.168.10.101 255.255.255.0
standby 1 ip 192.168.10.254
exit
inter vlan 20
no shut
ip add 192.168.20.101 255.255.255.0
standby 2 ip 192.168.20.254 
standby 2 priority 150
standby 2 preempt
exit
inter e0/3
no switchport
no shut
ip add 10.20.1.1 255.255.255.0
exit
ip routing
router ospf 10
network 192.168.10.0 0.0.0.255 area 0
network 192.168.20.0 0.0.0.255 area 0
network 10.20.1.0 0.0.0.255 area 0
exit


5. R1


inter e0/0
no shut
ip add 10.20.1.2 255.255.255.0
inter e0/1
no shut
ip add 10.10.1.2 255.255.255.0
inter e0/2
no shut
ip add 10.0.0.1 255.255.255.0
exit
ip route 0.0.0.0 0.0.0.0 e0/2 10.0.0.2
router ospf 10
network 10.10.1.0 0.0.0.255 area 0
network 10.20.1.0 0.0.0.255 area 0
default-information originate
exit


6. R2

inter e0/0
no shut
ip add 10.0.0.2 255.255.255.0
exit
ip route 0.0.0.0 0.0.0.0 e0/0 10.0.0.1