import QtQuick 2.0
import BasePlugins 1.0

QtObject {
    /*!
        Provides colours/assets/fonts for general elements.
     */
    property QtObject general: QtObject {
        readonly property color baseColor: "#7CCDFC"
        readonly property color baseSelectingColor: "#0078D7"
        readonly property color baseTextColor: "#0B132D"
        readonly property real  normalFontSize: 15 * dpiToPixelValue
        readonly property real  bigFontSize:  20 * dpiToPixelValue
        readonly property real  smallFontSize:  12 * dpiToPixelValue
        readonly property color splitterColor: "lightgray"

        readonly property color btnBackgroundDefaultColor: "white"
        readonly property color reportLabelColor: "#356C80"
        readonly property color pieInforBackgroundColor: "#80DDFF"
        readonly property color pieBorderDefaultColor: "white"
        readonly property color pieLabelDefaultColor: "#50b1f8"
        readonly property color markedPieBorderColor: "fuchsia"
    }


}
