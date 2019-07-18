#ifndef SAMPLEMODULES_PLUGIN_H
#define SAMPLEMODULES_PLUGIN_H

#include <QQmlExtensionPlugin>

class SampleModulesPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    void registerTypes(const char *uri) override;
};

#endif // SAMPLEMODULES_PLUGIN_H
