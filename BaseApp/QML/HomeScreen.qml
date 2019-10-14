import QtQuick 2.0
import BasePlugins 1.0
import GeneralPlugins 1.0

Item {
    Loader {
        id:appLoader
        anchors.top: recHeader.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right

    }

    property string activeApp

    Component.onCompleted: {
        appLoader.setSource("qrc:/QML/ScanDevicesScreen.qml")
        activeApp = "DevicesList"
    }

    ActionListener {
        actions: ["DisplayDeviceList"]
        onTriggered: {
            appLoader.setSource("qrc:/QML/ScanDevicesScreen.qml")
            txtHeader.text = qsTr("Devices List")
            activeApp = "DevicesList"
        }
    }

    ActionListener {
        actions: ["ShowReports"]

        onTriggered: {
            appLoader.setSource("qrc:/QML/SmartAdsPieReports_Tab.qml")
            txtHeader.text = qsTr("Reports")
            activeApp = "Reports"

            Action.dispatch("ReportUpdateData",
                                {
                                    locationData: data.selectedDevice
                                })
        }
    }

    Rectangle {
        id:recHeader
        width: parent.width
        height: Settings.baseButtonHeight
        color: Theme.general.baseColor
        Text {
            id: txtHeader
            text: qsTr("Device List")
            font.pixelSize: 24
            anchors.centerIn: parent
        }
        Image {
            source: "qrc:/Applications/Images/LeftArrow_White.png"
            fillMode: Image.PreserveAspectFit
            height: parent.height * 80 / 100
            width: height
            anchors.verticalCenter: parent.verticalCenter
            x: 5
            visible: activeApp !== "DevicesList"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (activeApp !== "DevicesList") {
                        Action.dispatch("DisplayDeviceList")
                    }
                }
            }
        }
    }

}
