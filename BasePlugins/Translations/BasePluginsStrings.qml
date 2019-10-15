pragma Singleton

import QtQuick 2.6

QtObject {
    id: basePluginsStrings

    property QtObject dialogMessages: QtObject {
        //: The label for login button
        readonly property string waitingMessage: QT_TR_NOOP("Please wait...")
    }

    // The context to use when translating the preceding strings.
    readonly property string context: "basePluginsStrings"

    // Translate the given text with the optional number (replaces %n in the text,
    // if present). The owner is used to help avoid garbage collection for strings
    // that don't change (most of them), as they are deleted along with the owner.
    function translate(owner, text, number) {
        number = (typeof number === 'undefined') ? -1 : number;
        return translator.translate(owner, context, text, number);
    }

}
