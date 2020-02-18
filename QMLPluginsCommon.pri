# QMLPluginsCommon.pri - This script is included from every .pro file
# of qml plugins
# This file provides the following macros for c files, they are also
# added to CONFIG for use in qmake files.

QT += gui quick qml

#import plugins to make QtCreator happy
!android: {
    QML_IMPORT_PATH += ../BasePlugins
}

# - setup the correct location to install to and load from
android {
    # android platform
    # From: http://community.kde.org/Necessitas/Assets
    SAMPLES_INSTALL_PATH=/assets/$$TARGET
    # - setup the 'make install' step
    samples.path = $$SAMPLES_INSTALL_PATH
    samples.files += $$SAMPLE_FILES
    samples.depends += FORCE
    INSTALLS += samples
}
CONFIG -= android_install

unix:!android {
    #create plugins.type file by using qmlplugindump
    qmakePath = $$QMAKE_QMAKE
    qmlplugindumpPath = $$replace(qmakePath, qmake, qmlplugindump)
    message($$TARGET)
    message($$PWD)
    system($$qmlplugindumpPath $$TARGET 1.0 $$PWD/$$TARGET/QML > $$installPath/plugins.qmltypes)
}
