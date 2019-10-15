import QtQuick 2.0
import QtQuick.Controls 2.0

import BasePlugins 1.0
import GeneralPlugins 1.0
import LotteryPlugins 1.0

ApplicationWindow {
    id: mainSmartAds

    visible: true
    width: 720

    // To run on Laptop, temporarily use heigh at 1000 due to the height of linux/windows screen can not be reached 1280
    // as the setting size (in main mobile app, it should be 1280)
    // The main impact may be the Flickable with its scrolled content. But now the content for it is variable depended on
    // the charts which is currently displaying. This result now is good, since we do not need to worry about this change
    height: 1000 //1280

    property QtObject runtimeSetting: QtObject {
        property string activeApp: ""
    }

    Loader {
        id:mainLoader
        source: "qrc:/SplashScreen.qml"
        anchors.fill: parent
    }

    ActionListener {
        actions: [ActionStrings.baseApp.initFinished]
        onTriggered: {
            mainLoader.setSource("qrc:/HomeScreen.qml")
        }
    }

    ActionListener {
        actions: [ActionStrings.baseApp.startInitSequence]
        onTriggered: {
            mainLoader.setSource("qrc:/InitializeScreen.qml")
        }
    }

    Component.onCompleted: {
        mainLoader.setSource("qrc:/SplashScreen.qml")
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
            visible: popupItem.popupAction === ActionStrings.dialogActions.showMessageDialog
        }
        Bootstrap_ProcessBarDialog {
            id: popupBootstrap_ProcessBarDialog
            anchors.fill: parent
            popupMessage: popupItem.popupMessage
            visible: popupItem.popupAction === ActionStrings.dialogActions.showProcessBarDialog
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
            visible: popupItem.popupAction === ActionStrings.dialogActions.showWaitingDialog
        }
        ActionListener {
            actions: [
                ActionStrings.dialogActions.showProcessBarDialog,
                ActionStrings.dialogActions.showMessageDialog,
                ActionStrings.dialogActions.showWaitingDialog
            ]
            onTriggered: {
                popupItem.visible = true
                if(data.settingObject !== undefined){
                    popupItem.settingObject = data.settingObject
                    popupItem.settingName = data.settingName
                }
                popupItem.popupMessage = data.popupMessage
                popupItem.popupAction = action
            }
        }

        ActionListener {
            actions:[
                ActionStrings.dialogActions.closeProcessBarDialog,
                ActionStrings.dialogActions.cancelProcessBarDialog,
                ActionStrings.dialogActions.closeMessageDialog,
                ActionStrings.dialogActions.closeWaitingDialog,
                ActionStrings.dialogActions.cancelWaitingDialog
            ]
            onTriggered: {
                popupItem.visible = false
                popupItem.popupAction = ""
            }
        }
    }
}
