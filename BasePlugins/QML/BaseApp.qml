import QtQuick 2.0
import BasePlugins 1.0

BaseScreen {
    Rectangle{
        anchors.fill: parent
        color: Theme.general.appBackgroundColor
    }
    MouseArea{
        anchors.fill: parent
        onClicked: {
            //DO NOTHING
        }
    }
}
