Manual Installation
Although the preferred method of installing programs is via the package managers described in Chapter 3, Adding, Removing and Updating Applications, you can also download and install individual package files containing software. There are many different kinds of Linux package files. Most of these are associated with the package managers of specific Linux distributions.

If you find a packaged application that you wish to install, it is recommended that you check if there is a native Kubuntu package of the application available through a package manager, and that you install that version instead. This guarantees that the program is completely compatible with your system. If there is no package available through the package manager, you can install it manually. The installation procedure depends on the type of package file.

Install/Uninstall .deb files
The package files associated with Kubuntu have the .deb suffix because of Kubuntu's close relation to the Debian GNU/Linux distribution. You can download and install individual .deb files. You will need administrative privileges to do this (see the section called “Root And Sudo”).

To install a .deb file, simply Right click on the .deb file, and choose Kubuntu Package Menu->Install Package.

Alternatively, you can also install a .deb file by opening a terminal and typing:

sudo dpkg -i package_file.deb
To uninstall a .deb file, remove it using Adept, or type:

sudo apt-get remove package_name
Convert .rpm files to .deb files
Another type of package files is Red Hat Package Manager Files which have the .rpm suffix. It is not recommended to install these on an Kubuntu system. In almost all cases, a native Kubuntu .deb package is available. However, if absolutely necessary, an .rpm file can be converted to a .deb package using the program alien.

Install the alien program (Chapter 3, Adding, Removing and Updating Applications).

Run the following command in a terminal, with administrative privileges:

sudo alien package_file.rpm
