Building QEMU for Windows with Inter-VM shared memory support.

Based on: http://lassauge.free.fr/qemu/QEMU_on_Windows.html
QEMU Release 2.1.2: http://wiki.qemu-project.org/download/qemu-2.1.2.tar.bz2 

Prepare environment
-----------------------------------------------------------------

Add C:\MinGW\bin to PATH variable

./configure:
ERROR: Python not found. Use --python=/path/to/python
Install python 2.7.9 from https://www.python.org/downloads/windows/ to C:/Python27

./configure --python=C:/Python27/python.exe
ERROR: pkg-config binary 'pkg-config' not found

download pkg-config from http://ftp.gnome.org/pub/gnome/binaries/win32/dependencies/
install pkg-config.exe to mingw/bin

./configure --python=C:/Python27/python.exe
ERROR: zlib check failed
       Make sure to have the zlib libs and headers installed.
Merge glib, glib-dev, gettext "bin,include,lib" directories withsame dirs of mingw
download libz-1.2.7-1-mingw32...lzma, unpack and merge with include,lib dirs of mingw

./configure --python=C:/Python27/python.exe
pkg-config fail due to absent of intl.dll 
tips: http://www.gaia-gis.it/spatialite-3.0.0-BETA/mingw_how_to.html
cd C:/MinGW/bin
cp libintl-8.dll intl.dll

./configure --python=C:/Python27/python.exe
ERROR: pixman >= 0.21.8 not present. Your options:
         (1) Preferred: Install the pixman devel package (any recent
             distro should have packages as Xorg needs pixman too).
         (2) Fetch the pixman submodule, using:
             git submodule update --init pixman
install libpixman-1-0.dll from http://qemu.weilnetz.de/w64/dll/ to mingw/bin - no result
delete previously installed libpixman-1-0.dll from /mingw/bin
download pixman from http://sourceforge.net/projects/gtk-mingw/files/pixman/
unpack and install to bin,include,lib by merge

./configure --python=C:/Python27/python.exe
ERROR: DTC (libfdt) not present. Your options:
         (1) Preferred: Install the DTC (libfdt) devel package
         (2) Fetch the DTC submodule, using:
             git submodule update --init dtc
download libfdt from http://lassauge.free.fr/qemu/QEMU_on_Windows.html