import QtQuick 2.0
import QtQuick.Window 2.0
import SampleModules 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    SampleModules{

    }

    SampleQML{
        anchors.fill:parent
    }
}
