import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Window 2.3
import BasePlugins 1.0
import GeneralPlugins 1.0

Window {
    id: mainSmartAds

    visible: true
    width: 720

    // To run on Laptop, temporarily use heigh at 1000 due to the height of linux/windows screen can not be reached 1280
    // as the setting size (in main mobile app, it should be 1280)
    // The main impact may be the Flickable with its scrolled content. But now the content for it is variable depended on
    // the charts which is currently displaying. This result now is good, since we do not need to worry about this change
    height: 1000//1280

    property QtObject runtimeSetting: QtObject {
        property string activeApp: ""
    }

    Loader {
        id:mainLoader
        source: "qrc:/SplashScreen.qml"
        anchors.fill: parent
    }



    Clipboard{
        id:clipboard
    }

    Bootstrap_Toast{
        id: toast
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10 * Settings.dpiToPixelValue
        anchors.horizontalCenter: parent.horizontalCenter
    }

    ActionListener {
        actions: [BaseActionStrings.baseApp.initFinished]
        onTriggered: {
            mainLoader.setSource("qrc:/HomeScreen.qml")
        }
    }

    ActionListener {
        actions: [BaseActionStrings.baseApp.startInitSequence]
        onTriggered: {
            mainLoader.setSource("qrc:/InitializeScreen.qml")
        }
    }

    Component.onCompleted: {
        if (Qt.platform.os === "ios" || Qt.platform.os === "android"){
            firebaseLoader.setSource("qrc:/FirebaseObject.qml")
        }
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
            visible: popupItem.popupAction === BaseActionStrings.dialogActions.showMessageDialog
        }
        Bootstrap_ProcessBarDialog {
            id: popupBootstrap_ProcessBarDialog
            anchors.fill: parent
            popupMessage: popupItem.popupMessage
            visible: popupItem.popupAction === BaseActionStrings.dialogActions.showProcessBarDialog
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
            visible: popupItem.popupAction === BaseActionStrings.dialogActions.showWaitingDialog
        }
        ActionListener {
            actions: [
                BaseActionStrings.dialogActions.showProcessBarDialog,
                BaseActionStrings.dialogActions.showMessageDialog,
                BaseActionStrings.dialogActions.showWaitingDialog
            ]
            onTriggered: {
                popupItem.visible = true
                if(data !== undefined){
                    if(data.settingObject !== undefined){
                        popupItem.settingObject = data.settingObject
                        popupItem.settingName = data.settingName
                    }
                    popupItem.popupMessage = data.popupMessage
                }
                popupItem.popupAction = action
            }
        }

        ActionListener {
            actions:[
                BaseActionStrings.dialogActions.closeProcessBarDialog,
                BaseActionStrings.dialogActions.cancelProcessBarDialog,
                BaseActionStrings.dialogActions.closeMessageDialog,
                BaseActionStrings.dialogActions.closeWaitingDialog,
                BaseActionStrings.dialogActions.cancelWaitingDialog
            ]
            onTriggered: {
                popupItem.visible = false
                popupItem.popupAction = ""
            }
        }
    }
}
