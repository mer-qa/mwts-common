%define _unpackaged_files_terminate_build 0 

Summary: Piglit meego core test suite
Name: mcts-piglit-tests
Version: 1.0.0
Release: 1
License: GPLv2
Group: System/Libraries
Source: %name-%version.tar.gz
#Requires: x11perf

%description

This is meego test suite package for common components


%prep
%setup -q

%build
./autogen
./configure --prefix=/usr
make

%install
rm -rf $RPM_BUILD_ROOT
make install DESTDIR=$RPM_BUILD_ROOT

%clean
rm -rf $RPM_BUILD_ROOT

%files
/opt/%name
/usr/share/%name

%changelog