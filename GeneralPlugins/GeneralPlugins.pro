#This file is generated from QtCreator
#Using QtCreator -> File -> New File or Project
#Library -> Qt Quick 2 Extension Plugin
TEMPLATE = lib
TARGET = GeneralPlugins
CONFIG += plugin c++11

TARGET = $$qtLibraryTarget($$TARGET)
uri = GeneralPlugins
version = 1.0

!include(../Common.pri) {
    error("Couldn't include Common.pri")
}

# Input
SOURCES += GeneralPlugins.cpp \
    SideMenuPresenter.cpp
HEADERS += GeneralPlugins.h \
    SideMenuPresenter.h

HEADERS += GeneralPresenter.h
SOURCES += GeneralPresenter.cpp

DISTFILES = qmldir

!equals(_PRO_FILE_PWD_, $$OUT_PWD) {
    copy_qmldir.target = $$OUT_PWD/qmldir
    copy_qmldir.depends = $$_PRO_FILE_PWD_/qmldir
    copy_qmldir.commands = $(COPY_FILE) "$$replace(copy_qmldir.depends, /, $$QMAKE_DIR_SEP)" "$$replace(copy_qmldir.target, /, $$QMAKE_DIR_SEP)"
    QMAKE_EXTRA_TARGETS += copy_qmldir
    PRE_TARGETDEPS += $$copy_qmldir.target
}

qmldir.files = qmldir
unix {
    installPath = $$[QT_INSTALL_QML]/$$replace(uri, \., /)
    qmldir.path = $$installPath
    target.path = $$installPath
    INSTALLS += target qmldir
}

RESOURCES += \
    generalplugins_images.qrc \
    generalplugins_qml.qrc
RESOURCES +=

!include(../QMLPluginsCommon.pri) {
    error("Couldn't include QMLPluginsCommon.pri")
}
