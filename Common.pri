# Common.pri - This script is included from every .pro file
#
# This file provides the following macros for c files, they are also
# added to CONFIG for use in qmake files.

win32: {
    CONFIG -= debug_and_release
    TARGET_INSTALL_PATH = C:\buildQt\build-SocialSupporter
}

INCLUDEPATH += ../
QT += core sql network
