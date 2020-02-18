#This file is generated from QtCreator
#Using QtCreator -> File -> New File or Project
#Library -> Qt Quick 2 Extension Plugin
TEMPLATE = lib
TARGET = BasePlugins
CONFIG += plugin c++11


TARGET = $$qtLibraryTarget($$TARGET)
uri = BasePlugins
version = 1.0

!include(../Common.pri) {
    error("Couldn't include Common.pri")
}

# Input
SOURCES += BasePlugins.cpp
HEADERS += BasePlugins.h

SOURCES += Control/QmlClipboardAdapter.cpp
HEADERS += Control/QmlClipboardAdapter.h

SOURCES += Actions/ActionDispatcher.cpp
HEADERS += Actions/ActionDispatcher.h

SOURCES += Actions/ActionListener.cpp
HEADERS += Actions/ActionListener.h

HEADERS += Actions/ActionSource.h

HEADERS += Actions/IActionListener.h

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
    baseplugins_images.qrc \
    baseplugins_qml.qrc
RESOURCES +=

!include(../QMLPluginsCommon.pri) {
    error("Couldn't include QMLPluginsCommon.pri")
}
