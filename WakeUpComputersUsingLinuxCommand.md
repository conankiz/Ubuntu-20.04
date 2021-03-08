
# How To Wake Up Computers Using Linux Command [ Wake-on-LAN ( WOL ) ] By Sending Magic Packets
##
## Intrudoction
Wake-on-LAN (WOL) is an Ethernet networking standard that allows a server to be turned on by a network message. You need to send ‘magic packets’ to wake-on-lan enabled ethernet adapters and motherboards to switch on the called systems. Make sure you connect the NIC (eth0 or eth1) with the motherboard and enable the BIOS’s WOL function. This is a quick guide to enable WOL under RHEL / Fedora / CentOS / Debian / Ubuntu Linux.

## Client Software
### Linux Install etherwake Under Debian / Ubuntu Linux
We use the etherwake command to send a Wake-On-LAN “Magic Packet” under Linux operating systems. Type the following apt-get command/apt command to install the same under Debian / Ubuntu Linux desktop:
### apply all patches on Debian/Ubuntu ##
```
$ sudo aptitude install etherwake
```
## OR
```
$ sudo apt install etherwake
```
### Installing a tool to send a Wake-On-LAN “Magic Packet” on RHEL/CentOS Linux
```
$ sudo yum install net-tools
````

### How Do I Send WOL Magic Packets Under Linux?
Type the following command:
```
$ wakeonlan MAC-Address-Here
```
OR
```
$ etherwake MAC-Address-Here
```
```
$ etherwake -D MAC-Address-Here
```

RHEL / Centos / Fedora Linux user, try:
```
$ ether-wake MAC-Address-Here
```
If your MAC address were xx:yy:zz:11:22:33, you would type:
```
$ wakeonlan xx:yy:zz:11:22:33
```

OR
```
$ etherwake xx:yy:zz:11:22:33
```
Where,

xx:yy:zz:11:22:33 is remote servers mac address. You can obtained mac address using combination of the ping command and arp command:
ping -c 4 server3 && arp -n

### How Do I Verify That Remote Linux Server Supports Wake-on-LAN (WOL)?
First, reboot the remote server and go to BIOS > Power Management > “Wake On LAN”. Please turn WoL on. Next, save and close the bios settings. After activating Wake On LAN (WoL) in your BIOS hardware option for the network interface card, it is also necessary to activate it using ethtool. The ethtool command will configure eth0 to respond to the magic packet:
```
$ ethtool -s eth0 wol g
```
Where,

-s eth0 : Your NIC. Feel free to replace eth0 with your actual network interface device name.
wol g : Sets Wake-on-LAN options using MagicPacket.
- Type the following command to see current status of wol for eth0:
```
$ ethtool eth0
Settings for eth0:
       Supported ports: [ TP MII ]
       Supported link modes:   10baseT/Half 10baseT/Full
                               100baseT/Half 100baseT/Full
       Supports auto-negotiation: Yes
       Advertised link modes:  10baseT/Half 10baseT/Full
                               100baseT/Half 100baseT/Full
       Advertised auto-negotiation: Yes
       Speed: 100Mb/s
       Duplex: Full
       Port: MII
       PHYAD: 1
       Transceiver: internal
       Auto-negotiation: on
       Supports Wake-on: pumbg
       Wake-on: d
       Current message level: 0x00000001 (1)
       Link detected: yes
```
 
wol p|u|m|b|a|g|s|d...

          Set Wake-on-LAN options.  Not all  devices  support  this.   The
          argument  to  this  option  is a string of characters specifying
          which options to enable.
          p  Wake on phy activity
          u  Wake on unicast messages
          m  Wake on multicast messages
          b  Wake on broadcast messages
          a  Wake on ARP
          g  Wake on MagicPacket(tm)
          s  Enable SecureOn(tm) password for MagicPacket(tm)
          d  Disable (wake on nothing).  This option clears  all  previous
             options.
