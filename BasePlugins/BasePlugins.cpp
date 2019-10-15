#include "BasePlugins.h"
#include "Actions/ActionDispatcher.h"
#include "Actions/ActionListener.h"

#include <QUrl>
#include <QtQml>
#include <qqml.h>

static QObject* CreateActionDispatcherInstance(QQmlEngine*, QJSEngine*)
{
    return new ActionDispatcher;
}

void BasePlugins::registerTypes(const char* uri)
{
    // @uri BasePlugins

    ///Basic controls
    qmlRegisterType(QUrl("qrc:///Applications/QML/BaseApp.qml"), uri, 1, 0, "BaseApp");
    qmlRegisterType(QUrl("qrc:///Applications/QML/BaseScreen.qml"), uri, 1, 0, "BaseScreen");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Button/BaseButton.qml"), uri, 1, 0, "BaseButton");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Layout/BaseLayout.qml"), uri, 1, 0, "BaseLayout");

    ///Controls with Bootstrap style
    qmlRegisterType(QUrl("qrc:///Controls/QML/Button/Bootstrap_DropDown.qml"), uri, 1, 0, "Bootstrap_DropDown");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Button/Bootstrap_DropDownNaked.qml"), uri, 1, 0, "Bootstrap_DropDownNaked");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Button/Bootstrap_TextboxWithIcon.qml"), uri, 1, 0, "Bootstrap_TextboxWithIcon");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Dialogs/Bootstrap_MessageDialog.qml"), uri, 1, 0, "Bootstrap_MessageDialog");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Dialogs/Bootstrap_ProcessBarDialog.qml"), uri, 1, 0, "Bootstrap_ProcessBarDialog");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Dialogs/Bootstrap_WaitingDialog.qml"), uri, 1, 0, "Bootstrap_WaitingDialog");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Button/Bootstrap_RadioButtons.qml"), uri, 1, 0, "Bootstrap_RadioButtons");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Controls/Bootstrap_RadioButtonList.qml"), uri, 1, 0, "Bootstrap_RadioButtonList");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Controls/Bootstrap_ProcessBar.qml"), uri, 1, 0, "Bootstrap_ProcessBar");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Rectangles/VerticalHalfRounded.qml"), uri, 1, 0, "VerticalHalfRounded");

    ///Common settings / theme
    qmlRegisterSingletonType(QUrl("qrc:///Controls/QML/Theme/Theme.qml"), uri, 1, 0, "Theme");
    qmlRegisterSingletonType(QUrl("qrc:///Applications/QML/BaseQMLSettings.qml"), uri, 1, 0, "Settings");
    qmlRegisterSingletonType(QUrl("qrc:///Applications/Translations/ActionStrings.qml"), uri, 1, 0, "ActionStrings");
        qmlRegisterSingletonType(QUrl("qrc:///Applications/Translations/BasePluginsStrings.qml"), uri, 1, 0, "BasePluginsStrings");

    // C++ Types
    qmlRegisterType<ActionListener, 0>(uri, 1, 0, "ActionListener");
    qmlRegisterSingletonType<ActionDispatcher>(uri, 1, 0, "Action", &CreateActionDispatcherInstance);
}
