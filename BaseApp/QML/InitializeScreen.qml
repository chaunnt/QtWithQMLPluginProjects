import QtQuick 2.0
import BasePlugins 1.0

Item {
    Component.onCompleted: {
        applicationInitializer.startStartupSequence();
        applicationInitializer.initializeApplication();
    }

    Image {
        id: imgLogo
        source: "qrc:/Applications/Images/AppBanner.png"
        fillMode: Image.PreserveAspectFit
        width: parent.width / 4 * 3
        anchors.centerIn: parent
    }
    Connections {
        target: applicationInitializer
        onInitFinished: {
            Action.dispatch(ActionStrings.baseApp.initFinished)
        }
    }

    Text {
        id: txtInitMessage
        text: applicationInitializer.initMessage
        width: parent.width - 20 * Settings.dpiToPixelValue
        anchors.bottom: itemInitProcess.top
        anchors.bottomMargin: 5 * Settings.dpiToPixelValue
        anchors.horizontalCenter: parent.horizontalCenter
        height: Settings.baseButtonHeight
        font.pixelSize: Theme.general.normalFontSize
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }
    Bootstrap_ProcessBar {
        id: itemInitProcess
        width: parent.width - 20 * Settings.dpiToPixelValue
        height: Settings.baseButtonHeight
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10 * Settings.dpiToPixelValue
        anchors.horizontalCenter: parent.horizontalCenter
        percentageValue: applicationInitializer.initProcess
    }
}
