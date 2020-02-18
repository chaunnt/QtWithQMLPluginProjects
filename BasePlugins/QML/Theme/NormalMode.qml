import QtQuick 2.0
import BasePlugins 1.0

QtObject {
    /*!
        Provides colours/assets/fonts for general elements.
     */
    property QtObject general: QtObject {
        readonly property color splashBackgroundColor: "#002E82"
        readonly property color appBackgroundColor: "#FFFFFF"
        readonly property color appBarBackgroundColor: "#002E82"
        readonly property color appBarTextColor: "#FFFFFF"
        readonly property color appDialogBackGroundColor: "#AA1C3F94"
        readonly property color baseColor: "#B71529"
        readonly property color baseSelectingColor: "#EE0D21"
        readonly property color baseTextColor: "black"
        readonly property color baseUnSelectedTextColor: "#ffffff"
        readonly property real  normalFontSize: (Qt.platform.os === "ios" ? 16 : 12) * Settings.dpiToPixelValue
        readonly property real  bigFontSize:  (Qt.platform.os === "ios" ? 20 : 16) * Settings.dpiToPixelValue
        readonly property real  smallFontSize:  (Qt.platform.os === "ios" ? 12 : 10) * Settings.dpiToPixelValue
        readonly property color splitterColor: "lightgray"
        readonly property color sideMenuTextColor: "white"
        readonly property color sideMenuItemTextColor: "black"
        readonly property color sideMenuForeColor: "#1C3F94"
        readonly property color sideMenuBackgroundColor: "#AA1C3F94"
        readonly property color sideMenuButtonColor: "#FFD201"

    }
}
