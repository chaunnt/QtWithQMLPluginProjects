#This file is generated from QtCreator
#Using QtCreator -> File -> New File or Project
#Library -> Qt Quick 2 Extension Plugin
TEMPLATE = lib
TARGET = SystemFunctions
CONFIG += c++11
win32 {
    CONFIG += staticlib
}

# Input
SOURCES += SystemFunctionsOwner.cpp
HEADERS += SystemFunctionsOwner.h

!include(../Common.pri) {
    error("Couldn't include Common.pri")
}

!include(General/General.pri) {
    error("Couldn't include General/General.pri")
}

INCLUDEPATH += ../

QMAKE_LFLAGS *= -L../Framework
QMAKE_LFLAGS *= -L../Setting

DEPENDPATH += . ../Framework
DEPENDPATH += . ../Setting

LIBS += -L../Framework/ -lFramework
LIBS += -L../Setting/ -lSetting

unix {
    target.path = $$TARGET_INSTALL_PATH
    INSTALLS += target

    strip.path = $$TARGET_INSTALL_PATH
    strip.extra = $$QMAKE_STRIP $(INSTALL_ROOT)/$$TARGET_INSTALL_PATH/lib$${TARGET}.$${QMAKE_EXTENSION_SHLIB}
    INSTALLS += strip
}

TARGET = $$qtLibraryTarget($$TARGET)
INSTALLS += $$TARGET_INSTALL_PATH
