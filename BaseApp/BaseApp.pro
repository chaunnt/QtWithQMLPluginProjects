CONFIG += c++11
TEMPLATE = app
QT += gui quick qml
# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
android: {

    QT += androidextras
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

    OTHER_FILES += \
        android/AndroidManifest.xml
}

!include(../Common.pri) {
    error("Couldn't include Common.pri")
}

SOURCES += main.cpp

SOURCES += AppManager.cpp
HEADERS += AppManager.h

RESOURCES += QML/qml.qrc
RESOURCES += resource/images.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
!android: {
    QML_IMPORT_PATH += ../BasePlugins/QML
    QML_IMPORT_PATH += ../GeneralPlugins/QML
}

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    android/AndroidManifest.xml \
    android/res/values/strings.xml \
    ios/Project-Info.plist \
    android/res/drawable-hdpi/ic_launcher.png \
    android/res/drawable-mdpi/ic_launcher.png \
    android/res/drawable-xhdpi/ic_launcher.png \
    android/res/drawable-xxhdpi/ic_launcher.png \
    ios/Def-568h@2x.png \
    ios/Def-667h@2x.png \
    ios/Def-Portrait-736h@3x.png \
    ios/Def-Portrait.png \
    ios/Def-Portrait@2x.png \
    ios/Def.png \
    ios/Def@2x.png \
    ios/Icon-60.png \
    ios/Icon-60@2x.png \
    ios/Icon-60@3x.png \
    ios/Icon-72.png \
    ios/Icon-72@2x.png \
    ios/Icon-76.png \
    ios/Icon-76@2x.png \
    ios/Icon-Small-40.png \
    ios/Icon-Small-40@2x.png \
    ios/Icon-Small-50.png \
    ios/Icon-Small-50@2x.png \
    ios/Icon.png \
    ios/Icon@2x.png

QMAKE_LFLAGS *= -L../Framework
QMAKE_LFLAGS *= -L../SystemFunctions
QMAKE_LFLAGS *= -L../GeneralPlugins
QMAKE_LFLAGS *= -L../BasePlugins

DEPENDPATH += . ../Framework
DEPENDPATH += . ../SystemFunctions
DEPENDPATH += . ../GeneralPlugins
DEPENDPATH += . ../BasePlugins

LIBS += -L../SystemFunctions/ -lSystemFunctions
LIBS += -L../Framework/ -lFramework
LIBS += -L../GeneralPlugins/ -lGeneralPlugins
LIBS += -L../BasePlugins/ -lBasePlugins

android: {
    ANDROID_EXTRA_LIBS += $$OUT_PWD/../SystemFunctions/libSystemFunctions.so
    ANDROID_EXTRA_LIBS += $$OUT_PWD/../Framework/libFramework.so
    ANDROID_EXTRA_LIBS += $$OUT_PWD/../GeneralPlugins/libGeneralPlugins.so
    ANDROID_EXTRA_LIBS += $$OUT_PWD/../BasePlugins/libBasePlugins.so

    ANDROID_EXTRA_PLUGINS += $$OUT_PWD/../SystemFunctions
    ANDROID_EXTRA_PLUGINS += $$OUT_PWD/../Framework
    ANDROID_EXTRA_PLUGINS += $$OUT_PWD/../GeneralPlugins
    ANDROID_EXTRA_PLUGINS += $$OUT_PWD/../BasePlugins
}

TARGET = $$qtLibraryTarget($$TARGET)
INSTALLS += $$TARGET_INSTALL_PATH
