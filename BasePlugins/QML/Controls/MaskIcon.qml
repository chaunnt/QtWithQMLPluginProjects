import QtQuick 2.0
import QtGraphicalEffects 1.12

Item {
    width: mask.width
    height: mask.height
    property string iconUrl: ""
    property color iconColor: "white"
    property alias fillMode: mask.fillMode
    property alias iconWidth: mask.width
    property alias iconHeight: mask.height
    Rectangle {
        id: maskSource
        width: parent.width
        height: parent.height
        color: iconColor
        visible: false
    }

    Image {
        id: mask
        source: iconUrl
        height: parent.height
        fillMode: Image.PreserveAspectFit
        smooth: true
        visible: false
    }

    OpacityMask {
        anchors.fill: maskSource
        source: maskSource
        maskSource: mask
    }
}
