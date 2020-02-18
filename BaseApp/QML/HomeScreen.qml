import QtQuick 2.0
import BasePlugins 1.0
import GeneralPlugins 1.0

BaseScreen {
    screenName: "HomeScreen"
    property string indexScreenSource: "" //TODO: we must add source for first screen
    Loader {
        id:appLoader
        anchors.fill: parent
    }

    Component.onCompleted: {
        appLoader.setSource(indexScreenSource)
    }

    ActionListener {
        actions: ["Initialize"]
        onTriggered: {
            switch(action){
            default:
                appLoader.setSource(indexScreenSource)
                break;
            }
        }
    }

    SideMenu {
        id:appSideMenu
        anchors.fill: parent
        visible: false
        ActionListener {
            actions: [
                BaseActionStrings.baseApp.displaySideMenu,
                BaseActionStrings.baseApp.closeSideMenu,
            ]
            onTriggered: {
                switch (action)
                {
                case BaseActionStrings.baseApp.displaySideMenu:
                    appSideMenu.open()
                    break;
                case BaseActionStrings.baseApp.closeSideMenu:
                    appSideMenu.close()
                    break;
                default:
                    appSideMenu.visible = false
                    break;
                }
            }
        }
    }

}
