import QtQuick 2.0
import BasePlugins 1.0
import GeneralPlugins 1.0

BaseScreen {
    screenName: "HomeScreen"
    Loader {
        id:appLoader
        anchors.top: recHeader.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
    }

    Component.onCompleted: {
        appLoader.setSource("qrc:/QML/LotteryHomeScreen.qml")
    }

    ActionListener {
        actions: ["DisplayLottery"]
        onTriggered: {
            appLoader.setSource("qrc:/QML/LotteryHomeScreen.qml")
        }
    }

    Rectangle {
        id:recHeader
        width: parent.width
        height: Settings.baseButtonHeight
        color: Theme.general.baseColor
        Text {
            text: Settings.activeScreenName
            font.pixelSize: Theme.general.bigFontSize
            anchors.centerIn: parent
            color: Theme.general.baseTextColor
        }
        Image {
            source: "qrc:/Applications/Images/LeftArrow_White.png"
            fillMode: Image.PreserveAspectFit
            height: parent.height * 80 / 100
            width: height
            anchors.verticalCenter: parent.verticalCenter
            x: 5
            visible: Settings.activeScreenName !== "HomeScreen"
            MouseArea {
                anchors.fill: parent
                onClicked: {

                }
            }
        }
    }

}
