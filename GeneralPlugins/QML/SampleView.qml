import QtQuick 2.0
import BasePlugins 1.0

Item {
    Rectangle {
        width: 500
        height: 500
        color: "yellow"
        Text {
            text: qsTr("SampleView")
            anchors.centerIn: parent
        }
        Image {
            source: "qrc:/Images/PluginLogo.png"
            width: 100
            height: 100
            anchors.centerIn: parent
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                Action.dispatch("testAction")
            }
        }
    }
    ActionListener {
        actions: ["testAction"]
        onTriggered: {
            console.log("triggg")
        }
    }
}
