#include "samplemodules_plugin.h"
#include "samplemodules.h"

#include <qqml.h>

void SampleModulesPlugin::registerTypes(const char *uri)
{
    // @uri SampleModules
    qmlRegisterType<SampleModules>(uri, 1, 0, "SampleModules");
}

