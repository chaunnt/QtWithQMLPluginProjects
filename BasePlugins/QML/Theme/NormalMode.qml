import QtQuick 2.0
import BasePlugins 1.0

QtObject {
    /*!
        Provides colours/assets/fonts for general elements.
     */
    property QtObject general: QtObject {
        readonly property color appBackgroundColor: "#B71529"
        readonly property color baseColor: "#EE0D21"
        readonly property color baseSelectingColor: "#EE0D21"
        readonly property color baseTextColor: "#FFFFFF"
        readonly property real  normalFontSize: 15 * Settings.dpiToPixelValue
        readonly property real  bigFontSize:  20 * Settings.dpiToPixelValue
        readonly property real  smallFontSize:  12 * Settings.dpiToPixelValue
        readonly property color splitterColor: "lightgray"
    }
}
