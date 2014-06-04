#-------------------------------------------------
#
# Project created by QtCreator 2013-01-07T17:48:44
#
#-------------------------------------------------

QT += core gui sql network
unix: QT += opengl
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

win32: CONFIG += console

TARGET = KaraokeHost
TEMPLATE = app

win32: DEFINES += ZLIB_WINAPI

#DEFINES += USE_FMOD
DEFINES += USE_GSTREAMER
# On Linux platforms QMediaPlayer uses gstreamer as its base.  You can not
# load both backends due to conflicts.
DEFINES += USE_QMEDIAPLAYER

SOURCES += main.cpp\
        mainwindow.cpp \
    queuetablemodel.cpp \
    rotationtablemodel.cpp \
    songdbtablemodel.cpp \
    libCDG/src/libCDG_Frame_Image.cpp \
    libCDG/src/libCDG_Color.cpp \
    libCDG/src/CDG_Frame_Image.cpp \
    libCDG/src/libCDG.cpp \
    sourcedirtablemodel.cpp \
    dbupdatethread.cpp \
    songdbloadthread.cpp \
    khqueuesong.cpp \
    khsinger.cpp \
    khsong.cpp \
    khregularsinger.cpp \
    khregularsong.cpp \
    khipcclient.cpp \
    khabstractaudiobackend.cpp \
    khzip.cpp \
    qglcanvas.cpp \
    khsettings.cpp \
    regularsingermodel.cpp \
    scrolltext.cpp \
    requeststablemodel.cpp \
    khdb.cpp \
    dlgkeychange.cpp \
    dlgcdgpreview.cpp \
    dlgdatabase.cpp \
    dlgrequests.cpp \
    dlgregularexport.cpp \
    dlgregularimport.cpp \
    dlgregularsingers.cpp \
    dlgsettings.cpp \
    dlgcdg.cpp \
    dlgdurationscan.cpp

HEADERS  += mainwindow.h \
    queuetablemodel.h \
    rotationtablemodel.h \
    songdbtablemodel.h \
    libCDG/include/libCDG.h \
    libCDG/include/libCDG_Frame_Image.h \
    libCDG/include/libCDG_Color.h \
    libCDG/include/CDG_Frame_Image.h \
    sourcedirtablemodel.h \
    dbupdatethread.h \
    songdbloadthread.h \
    khqueuesong.h \
    khsinger.h \
    khsong.h \
    khregularsinger.h \
    khregularsong.h \
    khipcclient.h \
    khabstractaudiobackend.h \
    khzip.h \
    qglcanvas.h \
    khsettings.h \
    regularsingermodel.h \
    scrolltext.h \
    requeststablemodel.h \
    khdb.h \
    dlgkeychange.h \
    dlgcdgpreview.h \
    dlgdatabase.h \
    dlgrequests.h \
    dlgregularexport.h \
    dlgregularimport.h \
    dlgregularsingers.h \
    dlgsettings.h \
    dlgcdg.h \
    dlgdurationscan.h

FORMS    += mainwindow.ui \
    dlgkeychange.ui \
    dlgcdgpreview.ui \
    dlgdatabase.ui \
    dlgrequests.ui \
    dlgregularexport.ui \
    dlgregularimport.ui \
    dlgregularsingers.ui \
    dlgsettings.ui \
    dlgcdg.ui \
    dlgdurationscan.ui

unix: QT_CONFIG -= no-pkg-config
unix: CONFIG += link_pkgconfig


win32: INCLUDEPATH += "C:\Users\nunya\Downloads\zlib125\zlib-1.2.5\contrib\minizip"
win32: INCLUDEPATH += "C:\Users\nunya\Downloads\zlib125\zlib-1.2.5"
unix: PKGCONFIG += minizip
win32: LIBS += -L"C:\Users\nunya\Downloads\zlib125dll\dllx64" -lzlibwapi
# win32: LIBS += -lminizip

contains(DEFINES, USE_GSTREAMER) {
    message("USE_GSTREAMER defined, building GStreamer audio backend")
    win32: INCLUDEPATH += "C:\gstreamer\1.0\x86_64\include\gstreamer-1.0"
    win32: INCLUDEPATH += "C:\gstreamer\1.0\x86_64\include\glib-2.0"
    win32: INCLUDEPATH += "C:\gstreamer\1.0\x86_64\lib\glib-2.0\include"
    PKGCONFIG += gstreamer-1.0
    HEADERS += khaudiobackendgstreamer.h
    SOURCES += khaudiobackendgstreamer.cpp
    win32: LIBS+= -L"C:\gstreamer\1.0\x86_64\lib" -lgstreamer-1.0 -lglib-2.0 -lgobject-2.0

}

contains(DEFINES, USE_QMEDIAPLAYER) {
        QT += multimedia
        HEADERS += khaudiobackendqmediaplayer.h
        SOURCES += khaudiobackendqmediaplayer.cpp
}

contains(DEFINES, USE_FMOD) {
        # If building on win32/64 you'll need to fix the paths
        message("USE_FMOD defined, building with Fmod audio backend (http://www.fmod.org) support")
	message("Please note that, while free for non-commercial use, FMOD is NOT open source")
        win32: INCLUDEPATH += "/home/isaac/.wine/drive_c/Program Files (x86)/FMOD SoundSystem/FMOD Programmers API Windows/api/inc"
	HEADERS += khaudiobackendfmod.h
	SOURCES += khaudiobackendfmod.cpp
        win32: LIBS += -L"/home/isaac/.wine/drive_c/Program Files (x86)/FMOD SoundSystem/FMOD Programmers API Windows/api/lib" -lfmodex
	unix {
		contains(QMAKE_HOST.arch, x86_64) {
			message("64bit UNIX/Linux platform detected, linking fmodex64")
			LIBS += -lfmodex64
		} else {
			message("UNIX/Linux platform does not appear to be 64bit, linking fmodex")
			LIBS += -lfmodex
		}
	}
}

RESOURCES += \
    resources.qrc

INCLUDEPATH += $$PWD/../Cdg2
DEPENDPATH += $$PWD/../Cdg2
