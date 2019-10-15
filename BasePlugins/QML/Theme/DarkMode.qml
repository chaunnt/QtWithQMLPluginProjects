import QtQuick 2.0
import BasePlugins 1.0

QtObject {
    /*!
        Provides colours/assets/fonts for general elements.
     */
    property QtObject general: QtObject {
        readonly property color appBackgroundColor: "#7CCDFC"
        readonly property color baseColor: "#7CCDFC"
        readonly property color baseSelectingColor: "#0078D7"
        readonly property color baseTextColor: "#0B132D"
        readonly property real  normalFontSize: 15 * Settings.dpiToPixelValue
        readonly property real  bigFontSize:  20 * Settings.dpiToPixelValue
        readonly property real  smallFontSize:  12 * Settings.dpiToPixelValue
        readonly property color splitterColor: "lightgray"

    }


}
