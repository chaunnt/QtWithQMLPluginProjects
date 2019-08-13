#pragma once

#include <QObject>

class ActionSource : public QObject
{
    Q_OBJECT

public:
    enum Type
    {
        Touch,
        HardKey
    };
    Q_ENUM(Type)
};
