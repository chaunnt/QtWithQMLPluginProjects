import QtQuick 2.0
import BasePlugins 1.0

Rectangle {
    id:recHeader
    width: Settings.screenWidth
    height: Settings.baseButtonHeight
    color: Theme.general.appBarBackgroundColor
    signal backKeyClicked()

    Text {
        text: Settings.activeScreenName
        font.pixelSize: Theme.general.bigFontSize
        anchors.left: imgBackIcon.right
        anchors.leftMargin: 10 * Settings.dpiToPixelValue
        color: Theme.general.appBarTextColor
        anchors.verticalCenter: parent.verticalCenter
    }
    Image {
        id:imgBackIcon
        source: "qrc:/Applications/Images/LeftArrow_White.png"
        fillMode: Image.PreserveAspectFit
        height: Settings.baseButtonHeight / 2
        width: height
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        x: 5
        visible: Settings.activeScreenName !== "HomeScreen"
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            backKeyClicked()
        }
    }
}
