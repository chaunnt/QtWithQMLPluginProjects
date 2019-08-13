#pragma once

#include <QJSValue>
#include <QString>

class IActionListener
{
public:
    virtual ~IActionListener() = default;

    virtual void ActionTriggered(const QString& ActionName, const QJSValue& Data) = 0;
};
