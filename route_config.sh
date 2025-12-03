# Konfigurasi Wilderland
auto eth0
iface eth0 inet static
    address 192.225.2.129
    netmask 255.255.255.192

auto eth1
iface eth1 inet static
    address 192.225.2.210
    netmask 255.255.255.248
    gateway 192.225.2.209 # Gateway ke Osgiliath/Moria

auto eth2
iface eth2 inet static
    address 192.225.2.193
    netmask 255.255.255.248

ip route add default via 192.225.2.202


# Konfigurasi Rivendell
auto eth0
iface eth0 inet static
    address 192.225.2.202
    netmask 255.255.255.248

auto eth1
iface eth1 inet static
    address 192.225.2.217
    netmask 255.255.255.248

auto eth2
iface eth2 inet static
    address 10.10.10.1
    netmask 255.255.255.252
    gateway 10.10.10.2

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -s 192.225.0.0/22 -o eth1 -j SNAT --to-source 10.10.10.1

# Konfigurasi Minastir
auto eth0
iface eth0 inet static
    address 192.225.0.1
    netmask 255.255.254.0

auto eth2
iface eth2 inet static
    address 192.225.2.203
    netmask 255.255.255.248
    gateway 192.225.2.201 # Gateway ke Osgiliath

auto eth1
iface eth1 inet static
    address 192.225.2.233
    netmask 255.255.255.252
    
ip route add default via 192.225.2.202

# Konfigurasi Pelargir
auto eth0
iface eth0 inet static
    address 192.225.2.234
    netmask 255.255.255.252
    gateway 192.225.2.233 # Gateway ke Minastir

auto eth2
iface eth2 inet static
    address 192.225.2.225
    netmask 255.255.255.248

auto eth1
iface eth1 inet static
    address 192.225.2.237
    netmask 255.255.255.252

ip route add default via 192.225.2.233

# Konfigurasi AmduinBanks
auto eth0
iface eth0 inet static
    address 192.225.2.1
    netmask 255.255.255.128

auto eth1
iface eth1 inet static
    address 192.225.2.238
    netmask 255.255.255.252
    gateway 192.225.2.237 # Gateway ke Pelargir

ip route add default via 192.225.2.237

# Konfigurasi Client DHCP (Khamul, Durin, Gilgalad, Elendil, Cirdan, dan Isildur )
auto eth0
iface eth0 inet dhcp

