import QtQuick 2.0
import BasePlugins 1.0

QtObject {
    /*!
        Provides colours/assets/fonts for general elements.
     */
    property QtObject general: QtObject {
        readonly property color titleColor: "#2E90BF"
        readonly property string logo: "/Applications/Images/SoundWaveBg.jpg"
        readonly property string titleFont: "Helvetica"
    }

    /*!
        Provides colours/assets/fonts for login (For example) screen
    */
    property QtObject loginScreen: QtObject {
        readonly property color textBoxColor: "#2E90BF"
        readonly property string logo: "/Applications/Images/SoundWaveBg.jpg"
        readonly property string textBoxFont: "Tahoma"
    }
}
