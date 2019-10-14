import QtQuick 2.0
import QtQuick.Controls 2.0

import BasePlugins 1.0
import GeneralPlugins 1.0

ApplicationWindow {
    id: mainSmartAds

    visible: true
    width: 720

    // To run on Laptop, temporarily use heigh at 1000 due to the height of linux/windows screen can not be reached 1280
    // as the setting size (in main mobile app, it should be 1280)
    // The main impact may be the Flickable with its scrolled content. But now the content for it is variable depended on
    // the charts which is currently displaying. This result now is good, since we do not need to worry about this change
    height: 1000 //1280

    Loader {
        id:mainLoader
        source: "qrc:/SplashScreen.qml"
        anchors.fill: parent
    }
    ActionListener {
        actions: ["FinishSplash"]
        onTriggered: {
            mainLoader.setSource("qrc:/HomeScreen.qml")
        }
    }

    Item {
        id: popupItem
        anchors.fill: parent
        property string popupMessage
        property QtObject settingObject
        property string settingName
        property string popupAction
        Bootstrap_MessageDialog {
            anchors.fill: parent
            popupMessage: popupItem.popupMessage
            visible: popupItem.popupAction === "ShowMessageDialog"
        }
        Bootstrap_ProcessBarDialog {
            id: popupBootstrap_ProcessBarDialog
            anchors.fill: parent
            popupMessage: popupItem.popupMessage
            visible: popupItem.popupAction === "ShowProcessBarDialog"
            Binding {
                target: popupBootstrap_ProcessBarDialog
                property: "percentageValue"
                value: ((popupItem.settingName !== '') && (popupItem.settingObject !== null)) ? popupItem.settingObject[popupItem.settingName] : 0
                when: popupBootstrap_ProcessBarDialog.visible
            }
        }
        Bootstrap_WaitingDialog {
            anchors.fill: parent
            popupMessage: popupItem.popupMessage
            visible: popupItem.popupAction === "ShowWaitingDialog"
        }
        ActionListener {
            actions: [ "ShowProcessBarDialog","ShowMessageDialog","ShowWaitingDialog" ]
            onTriggered: {
                popupItem.visible = true
                if(data.settingObject !== undefined){
                    popupItem.settingObject = data.settingObject
                    popupItem.settingName = data.settingName
                }
                popupItem.popupMessage = data.popupMessage
                popupItem.popupAction = action
                console.log(popupItem.settingName)
                console.log(data.settingName)
            }
        }

        ActionListener {
            actions:[
                "CloseProcessBarDialog",
                "CancelProcessBarDialog",
                "CloseMessageDialog",
                "CloseWaitingDialog",
                "CancelWaitingDialog"
            ]
            onTriggered: {
                popupItem.visible = false
                popupItem.popupAction = ""
            }
        }
    }
}
