pragma Singleton

import QtQuick 2.0

QtObject {

    /*!
        Array of available modes, name must match the <file name>.qml
     */
    readonly property var modeList : ["DarkMode", "NormalMode"]

    /*!
        Specifies the current mode. The theme is loaded dynamically and any change to
        this value will cause all properties bound to theme colours to be updated.
     */
    property string mode: "NormalMode"

    /*!
        Provides colours/assets/fonts for general elements.
     */
    property QtObject general: themeLoader.item.general

    /*!
        Provides colours/assets/fonts for login (For example) screen
     */
    property QtObject loginScreen: themeLoader.item.loginScreen

    /*!
        Loads the theme QML file dynamically when the \l theme property changes.

        \internal
     */
    property Loader themeLoader: Loader {
        source: "/Controls/QML/Theme/" + mode + ".qml"
    }
}
