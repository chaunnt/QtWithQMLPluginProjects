TEMPLATE = app

CONFIG += c++11
CONFIG += release
!include(../Common.pri) {
    error("Couldn't include Common.pri")
}

TEMPLATE = app
QT += core gui quick qml
# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS
TARGET = $$qtLibraryTarget(Vietlot)
INSTALLS += $$TARGET_INSTALL_PATH
# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += main.cpp

SOURCES += ApplicationInitializer.cpp
HEADERS += ApplicationInitializer.h

INCLUDEPATH += ../
RESOURCES += QML/qml.qrc
RESOURCES += resource/images.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
!android: {
    QML_IMPORT_PATH += ../BasePlugins
    QML_IMPORT_PATH += ../GeneralPlugins
}

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

PLATFORMS_DIR = $$PWD

unix:{
    message("Add libraries for UNIX")
    QMAKE_LFLAGS *= -L../Framework
    QMAKE_LFLAGS *= -L../Setting
    QMAKE_LFLAGS *= -L../SystemFunctions
    QMAKE_LFLAGS *= -L../GeneralPlugins
    QMAKE_LFLAGS *= -L../BasePlugins

    DEPENDPATH += . ../Framework
    DEPENDPATH += . ../Setting
    DEPENDPATH += . ../SystemFunctions
    DEPENDPATH += . ../GeneralPlugins
    DEPENDPATH += . ../BasePlugins

    LIBS += -L../SystemFunctions/ -lSystemFunctions
    LIBS += -L../Framework/ -lFramework
    LIBS += -L../Setting/ -lSetting
    LIBS += -L../GeneralPlugins/ -lGeneralPlugins
    LIBS += -L../BasePlugins/ -lBasePlugins
}else:{
    message("Add libraries for WINDOWS")
}

