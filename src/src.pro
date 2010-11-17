TARGET = mwts-common
#DEFINES += MWTSCOMMON
VERSION = 0.0.1
TEMPLATE = lib
CONFIG += debug
CONFIG += warn_on

QT += \
	network \
	dbus \
	xml

MOC_DIR = ../tmp
OBJECTS_DIR = ../tmp

PRECOMPILED_HEADER=stable.h

SOURCES += \
	mwtsapp.cpp \
	mwtsload.cpp \
	mwtstest.cpp \
	mwtsresult.cpp \
	mwtslog.cpp \
	mwtsmin.cpp \
	mwtsmeasure.cpp \
	mwtsglobal.cpp \
	mwtsconfig.cpp \
	mwtsmonitor.cpp \
	mwtsiteration.cpp \
	mwtsthroughput.cpp \
	mwtsmonitorlogger.cpp \
	mwtsmemorymonitor.cpp \
	mwtscpumonitor.cpp \
	mwtsabstractmonitor.cpp \
	mwtsmemorymeasurement.cpp \
	mwtsradio.cpp \
	mwtsstatistics.cpp \
	mwtssocket.cpp \
	mwtsendurance.cpp

HEADERS += \
	MwtsCommon \
	mwtsload.h \
	mwtsapp.h \
	mwtstest.h \
	mwtsresult.h \
	mwtslog.h \
	mwtsmin.h \
	mwtsmeasure.h \
	mwtsglobal.h \
	mwtsconfig.h \
	mwtsmonitor.h \
	mwtsiteration.h \
	mwtsthroughput.h \
	mwtsmonitorlogger.h \
	mwtsmemorymonitor.h \
	mwtscpumonitor.h \
	mwtsabstractmonitor.h \
	mwtsmemorymeasurement.h \
	mwtsradio.h \
	mwtsstatistics.h \
	mwtssocket.h \
	mwtsendurance.h \
	stable.h

#LIBS += -lminutils -lmintmapi -lminevent
LIBS += -lminutils -lminevent
target.path = /usr/lib
INSTALLS += target
HEADERS.version = Versions
HEADERS.files = MwtsCommon mwts*.h
HEADERS.path = /usr/include
INSTALLS += HEADERS