#pragma once

#include <QQmlExtensionPlugin>

class BasePlugins : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    enum Bootstrap_RoundButton_Type {
        TextOnly,
        IconOnly,
        TextAndIcon
    };
    Q_ENUMS(Bootstrap_RoundButton_Type)

    enum ButtonShape {
        CircleButton,
        RoundedCornerButton,
    };
    Q_ENUMS(ButtonShape)

    void registerTypes(const char* uri) override;
};
