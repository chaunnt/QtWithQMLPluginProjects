import QtQuick 2.0
import BasePlugins 1.0

Item {
    property bool finishInit: false
    property bool splashFinish: false

    function finalizeInitiation(){
        Action.dispatch(BaseActionStrings.dialogActions.closeWaitingDialog)
        Action.dispatch(BaseActionStrings.baseApp.initFinished)
    }

    Component.onCompleted: {
        applicationInitializer.startStartupSequence();
        applicationInitializer.initializeApplication();
    }

    Connections {
        target: applicationInitializer
        onInitFinished: {
            finishInit = true
            splashFinish = true
            if(splashFinish){
                finalizeInitiation()
            }
        }
    }
    Rectangle {
        anchors.fill: parent
        color: Theme.general.splashBackgroundColor
    }
    Image {
        id: imgLogo
        source: "qrc:/Applications/Images/AppLogo.png"
        fillMode: Image.PreserveAspectFit
        width: parent.width / 4 * 3
        anchors.centerIn: parent
    }
}
