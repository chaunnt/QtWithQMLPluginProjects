import QtQuick 2.0
import BasePlugins 1.0

QtObject {
    /*!
        Provides colours/assets/fonts for general elements.
     */
    property QtObject general: QtObject {
        readonly property color baseColor: "#E5CA05"
        readonly property color baseSelectingColor: "#0B132D"
        readonly property color baseTextColor: "#0B132D"
        readonly property color normalFontSize: 15 * dpiToPixelValue
        readonly property real  bigFontSize:  20 * dpiToPixelValue
        readonly property real  smallFontSize:  12 * dpiToPixelValue
    }


}
