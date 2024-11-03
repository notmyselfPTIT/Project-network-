
1.	Đối với SW13
ena
conf t
vlan 10
name Account
exit
spanning-tree mode mst
spanning-tree mst configuration
instan 1 vlan 10,20
instan 2 vlan 30,40
exit
inter range e0/1,e0/3
sw mode acc
sw acc vlan 10
spanning-tree portfast edge
spanning-tree bpduguard enable
exit
switchport nonegotiate
inter range e0/0,e0/2
sw trunk encapsulation dot1q 
sw mode trunk
exit
2.	Đối với SW16
 ena
conf t
vlan 20
name Customer_Service
exit
spanning-tree mode mst 
spanning-tree mst configuration
instan 1 vlan 10,20
instan 2 vlan 30,40
exit

inter range e0/2-3
sw mode acc
sw acc vlan 20
spanning-tree portfast edge
spanning-tree bpduguard enable
exit
switchport nonegotiate
inter range e0/0-1
sw trunk encapsulation dot1q
sw mode trunk
exit
3.	Đối với SW12
 ena
conf t
vlan 30
name Engineer
exit
spanning-tree mode mst
spanning-tree mst configuration
instan 1 vlan 10,20
instan 2 vlan 30,40
exit
inter range e0/0,e0/3
sw mode acc
sw acc vlan 30
spanning-tree portfast edge
spanning-tree bpduguard enable
exit
switchport nonegotiate
inter range e0/1-2
sw trunk encapsulation dot1q
sw mode trunk
exit
ip access-list extend DENY_ACCESS
permit tcp any 192.168.1.128 0.0.0.63 eq telnet 
exit
vlan access-map DONT
match ip address DENY_ACCESS
action drop
vlan access-map DONT
action forward
exit
vlan filter DONT vlan-list all
4.	Đối với SW11
 ena 
conf t
vlan 40
name IT
exit
spanning-tree mode mst
spanning-tree mst configuration
instan 1 vlan 10,20
instan 2 vlan 30,40
exit
inter range e0/2-3
sw mode acc
sw acc vlan 40
spanning-tree portfast edge
spanning-tree bpduguard enable
exit
switchport nonegotiate
inter range e0/0-1
sw trunk encapsulation dot1q
sw mode trunk
exit
5.	Đối với SWL36
 ena 
conf t
 vtp domain phongptit.edu
vtp password 123
vtp mode client
switchport nonegotiate
inter range e0/0-3,e1/0-1
sw trunk encapsulation dot1q
sw mode trunk
exit
spanning-tree mode mst
spanning-tree mst configuration
instan 1 vlan 10,20
instan 2 vlan 30,40
exit
6.	Đối với SWL32
 ena 
conf t
  vtp domain phongptit.edu
vtp password 123
vtp mode client
switchport nonegotiate
inter range e0/0-3,e1/0-1
sw trunk encapsulation dot1q
sw mode trunk 
exit
spanning-tree mode mst
spanning-tree mst configuration
instan 1 vlan 10,20
instan 2 vlan 30,40
exit
7.	SWL33
ena 
conf t
vlan 10
name Account
vlan 20
name Customer_Service
vlan 30
name Engineer
vlan 40
name IT
exit
vtp domain phongptit.edu
vtp password 123
vtp mode server
inter vlan 10
no shut
ip add 192.168.1.62 255.255.255.192
standby 1 ip 192.168.1.1
standby 1 priority 150
standby 1 preempt
inter vlan 20
no sh
ip add 192.168.1.126 255.255.255.192
standby 2 ip 192.168.1.65
standby 2 priority 150 
standby 2 preempt
inter vlan 30
no shut
ip add 192.168.1.190 255.255.255.192
standby 3 ip 192.168.1.129 
inter vlan 40
no shut
ip add 192.168.1.254 255.255.255.192
standby 4 ip 192.168.1.193
exit 
switchport nonegotiate
inter range e0/0-1
sw trunk encapsulation dot1q
sw mode trunk
exit
inter range e0/2-3,e1/0,e1/3
channel-group 1 mode active
no sh
exit
inter port 1 
no shut
sw trunk encapsulation dot1q
sw mode trunk
exit
port-channel load-balance src-dst-ip

spanning-tree mode mst
spanning-tree mst configuration
instan 1 vlan 10,20
instan 2 vlan 30,40
exit
spanning-tree mst 1 root primary
spanning-tree mst 2 root secondary
inter range e1/1-2
no switchport
exit
ip routing

8.	SWL31
 ena 
conf t
vtp domain phongptit.edu
vtp password 123
vtp mode server
vlan 10
name Account
vlan 20
name Customer_Service
vlan 30
name Engineer
vlan 40
name IT
exit
inter vlan 10
no shut
ip add 192.168.1.61 255.255.255.192
standby 1 ip 192.168.1.1 
inter vlan 20
no shut
ip add 192.168.1.125 255.255.255.192
standby 2 ip 192.168.1.65
inter vlan 30
no shut
ip add 192.168.1.189 255.255.255.192
standby 3 ip 192.168.1.129
standby 3 priority 150
standby 3 preempt
inter vlan 40
no shut
ip add 192.168.1.253 255.255.255.192
standby 4 ip 192.168.1.193
standby 4 priority 150
standby 4 preempt
exit
switchport nonegotiate
inter range e0/0-1
sw trunk encapsulation dot1q
sw mode trunk
exit
inter range e0/2-3,e1/0,e1/3
channel-group 1 mode passive
exit
inter port 1
no shut
sw trunk encapsulation dot1q
sw mode trunk
exit
port-channel load-balance src-dst-ip
spanning-tree mode mst
spanning-tree mst configuration
instan 1 vlan 10,20
instan 2 vlan 30,40
exit
spanning-tree mst 2 root primary
spanning-tree mst 1 root secondary
inter range e1/1-2
no switchport
exit
ip routing
