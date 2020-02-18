pragma Singleton

import QtQuick 2.6

// this is all the action strings which will be used for Action / Dispatcher
// we do not need to translate these messages.
// we only collect them in 1 files to make it conherence through whole application
// we did not consider to use it in C++ yet
QtObject {
    id: generalActionStrings

    //: The action for showing policy screen
    readonly property string displayPolicyScreen: "displayPolicyScreen"

    //: The action for showing contact screen
    readonly property string displayContact: "displayContact"

    //: The action for showing contact screen
    readonly property string displayContactScreen: "displayContactScreen"

    //: The action for showing contact screen
    readonly property string displayPolicy: "displayPolicy"

    //: The action for showing contact screen
    readonly property string displaypolicyScreen: "displaypolicyScreen"
}
