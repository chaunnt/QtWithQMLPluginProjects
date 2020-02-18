import QtQuick 2.0
import BasePlugins 1.0
import GeneralPlugins 1.0

BaseApp {
    property QtObject generalPresenter: GeneralPresenter {}
    property string forwardAction: ""
    Loader {
        id: loaderGeneralApp
        anchors.fill: parent
    }
    function displayHomeScreen(){
        loaderGeneralApp.setSource("qrc:/QML/ContactScreen.qml")
    }

    Component.onCompleted: {
        //generalPresenter.loadContactInfor()
        if (forwardAction === ""){
            displayHomeScreen()
        } else {
            Action.dispatch(forwardAction)
            forwardAction = ""
        }
    }

    ActionListener {
        actions: [
            GeneralActionStrings.displayContactScreen,
            GeneralActionStrings.displayPolicyScreen
        ]
        onTriggered: {
            switch (action)
            {
            case GeneralActionStrings.displayContactScreen:
                loaderGeneralApp.setSource("qrc:/QML/ContactScreen.qml",
                                        {
                                            presenter: generalPresenter,
                                        })
                break;
            case GeneralActionStrings.displayPolicyScreen:
                loaderGeneralApp.setSource("qrc:/QML/PolicyScreen.qml",
                                        {
                                            presenter: generalPresenter,
                                        })
                break;
            default:
                displayHomeScreen()
                break;
            }
        }
    }
}
