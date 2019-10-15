import QtQuick 2.9
import QtQuick.Controls 2.2
import BasePlugins 1.0

Column{
    property string currentTextValue: ""
    property bool isDropDowned: false
    property bool enabledDropDowned: true
    height: implicitHeight
    spacing: 20 * Settings.dpiToPixelValue
    Rectangle {
        id: recDisplay
        width: parent.width
        height: Settings.baseButtonHeight
        radius: 5 * Settings.dpiToPixelValue
        color: Theme.general.baseColor
        Text{
            id: txtDisplay
            text: currentTextValue
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            height: parent.height
            width: parent.width - parent.height / 2
            x:(parent.width - parent.height / 2) / 2 - width / 2
            color: Theme.general.baseTextColor
            font.pixelSize: Theme.general.normalFontSize
            elide: Text.ElideRight
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                isDropDowned = !isDropDowned
            }
        }
        Image {
            id: imgCbbLeftIcon
            width: height
            height: parent.height / 2
            source: !enabledDropDowned ? "" : "qrc:/Applications/Images/DownArrow_Black.png"
            rotation: isDropDowned ? 90 : 0
            anchors.right: parent.right
            anchors.rightMargin: 5 * Settings.dpiToPixelValue
            y:parent.height / 2 - height / 2
        }
    }
}

