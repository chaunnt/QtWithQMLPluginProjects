#include "GeneralPlugins.h"
#include "GeneralPresenter.h"

#include <qqml.h>

void GeneralPlugins::registerTypes(const char* uri)
{
    // @uri SampleModules
    qmlRegisterType(QUrl("qrc:///QML/SampleView.qml"), uri, 1, 0, "SampleView");
}
