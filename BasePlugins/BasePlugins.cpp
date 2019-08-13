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
    // @uri SampleModules
    qmlRegisterType(QUrl("qrc:///Applications/QML/BaseApp.qml"), uri, 1, 0, "BaseApp");
    qmlRegisterType(QUrl("qrc:///Custom/QML/Button/BaseButton.qml"), uri, 1, 0, "BaseButton");
    qmlRegisterType(QUrl("qrc:///Custom/QML/Layout/BaseLayout.qml"), uri, 1, 0, "BaseLayout");
    qmlRegisterSingletonType(QUrl("qrc:///Controls/QML/Theme/Theme.qml"), uri, 1, 0, "Theme");
    qmlRegisterSingletonType(QUrl("qrc:///Applications/QML/BaseQMLSettings.qml"), uri, 1, 0, "BaseQMLSettings");

    // C++ Types
    qmlRegisterType<ActionListener, 0>(uri, 1, 0, "ActionListener");
    qmlRegisterSingletonType<ActionDispatcher>(uri, 1, 0, "Action", &CreateActionDispatcherInstance);
}
