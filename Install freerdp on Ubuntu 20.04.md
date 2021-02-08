## 
### Table of contents

[I. Introducton](#modau)

[II. Getting Start](#batdau)
- [1. Step 1: Install FreeRDP](#step1)
- [2. Step 2: How to connect with freerdp command](#step2)
- [3. Step 3](#step3)
- [4. Step 4](#step4)


[III. Summary](#Tongket)

===========================

<a name="Modau"></a>
## I. Introduction
FreeRDP is a free implementation of the Remote Desktop Protocol (RDP), released under the Apache license. Enjoy the freedom of using your software wherever you want, the way you want it, in a world where interoperability can finally liberate your computing experience.
<a name="batdau"></a>
## II. Getting Start:

<a name="step1"></a>
## Step 1: Install FreeRDP
- Update system
> $ sudo apt update

- Install 
> $ sudo apt install freerdp2-x11

<a name="step2"></a>
## Step 2: How to connect with freerdp command
- To connect to the remote desktop using xfreerdp, run a command of the form:

``` $ xfreerdp /f /u:USERNAME /p:PASSWORD /v:HOST[:PORT] ```
> $ xfreerdp /multimon /u:setup@tic.local /v:192.168.11.98
- To toggle between full-screen and windowed modes, use the keyboard shortcut Ctrl+Alt+Enter.
When connecting for the first time, the following message about the problem with the certificate appears:
- Since self-signed certificates are used without a private CA (authentication center, certification authority) added to the store, the only choice is to agree to trust the specified certificate, enter Y for this.
- In full screen mode, you can disconnect from the remote desktop in two ways:

press the cross on the top panel
Start button → Shutdown → Disconnect

- To run in windowed mode, do not use the /f option:

> $ xfreerdp /u:Tester /p:1234 /v:192.168.0.101

<a name="step3"></a>
## Step 3: How to create shared folders in freerdp
With remote desktop connected via RDP, you can have shared folders. Let's look at a few examples.

To connect all mount points in the current system as shared folders on the remote desktop, use the +drives option, for example:

> $ xfreerdp /u:Tester /p:1234 /v:192.168.0.101 +drives

The screenshot shows the remote Windows desktop, in which the Linux system folders are accessible:

- To connect only the home folder of the current Linux user as a network folder to the computer via RDP, specify the +home-drive option:

> $ xfreerdp /u:Tester /p:1234 /v:192.168.0.101 +home-drive

In this case, the home folder is mounted on a system connected via the remote desktop protocol:
With the option /drive:NAME,/PATH/IN/LINUX, you can connect any folder with any name. The path in the current system must be specified as /PATH/IN/LINUX, and NAME is the name that will have the share in the remote system. For example, to connect the root folder of the current system (/) to the remote folder with the root name:

> $ xfreerdp /u:Tester /p:1234 /v:192.168.0.101 /drive:root,/

<a name="step4"></a>
## Step 4: How to bring remote desktop to another monitor
If you have several monitors, then you can choose which one to use for the remote system. To list the monitors, run the command:

> $ xfreerdp monitor-list

Select the monitor (or multiple monitors) identifier using the /monitors:<id>[,[,…]] option

- How to set the size of the remote desktop window
The following example connects to the rdp.contoso.com host with the name USER and is 50 percent of the height.

> $ xfreerdp /u:USER /size:50%h /v:rdp.contoso.com

If width (w) is set instead of height (h), something like /size:50%w, then 50 percent of the width will be used.

<a name="tongket"></a>
## III. Summary:

Watch Video here: 

- [How to Install and configure Samba on Ubuntu 20.04 Part 1:  Public folder](https://youtu.be/2o5zgA8ml38)
- [How to configure and Install Samba on Ubuntu 20.04 Part2: Private Share](https://youtu.be/6s9ZEp3xS94)

Contact me:
- Email: manhhungbl@gmail.com
- Skype: spyerx3
- Youtube Channel: youtube.com/howtoused

Thank you very much!
