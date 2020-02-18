#This file is generated from QtCreator
#Using QtCreator -> File -> New File or Project
#Library -> Qt Quick 2 Extension Plugin
TEMPLATE = lib
TARGET = Framework
win32 {
    CONFIG += staticlib
}

!include(../Common.pri) {
    error("Couldn't include Common.pri")
}

CONFIG += c++11

TARGET = $$qtLibraryTarget($$TARGET)

DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += $$PWD/GlobalDefine.cpp
HEADERS += $$PWD/GlobalDefine.h

SOURCES += $$PWD/CommonFunctions/CommonFunctions.cpp
HEADERS += $$PWD/CommonFunctions/CommonFunctions.h

HEADERS += $$PWD/Utils/QtSingleton.h

SOURCES += $$PWD/FrameworkOwner.cpp
HEADERS += $$PWD/FrameworkOwner.h

SOURCES += $$PWD/ServerCommunication/ServerBase.cpp
HEADERS += $$PWD/ServerCommunication/ServerBase.h

SOURCES += $$PWD/SystemFile/FileManagerBase.cpp
HEADERS += $$PWD/SystemFile/FileManagerBase.h

SOURCES += $$PWD/DBCommunication/DBLocalBase.cpp
HEADERS += $$PWD/DBCommunication/DBLocalBase.h

#unix {
#    target.path = $$TARGET_INSTALL_PATH
#    INSTALLS += target

#    strip.path = $$TARGET_INSTALL_PATH
#    strip.extra = $$QMAKE_STRIP $(INSTALL_ROOT)/$$TARGET_INSTALL_PATH/lib$${TARGET}.$${QMAKE_EXTENSION_SHLIB}
#    INSTALLS += strip
#}

