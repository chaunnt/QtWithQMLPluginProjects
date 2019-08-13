#pragma once

#include "IActionListener.h"

#include <QQuickItem>

class ActionListener : public QQuickItem, public IActionListener
{
    Q_OBJECT

    Q_PROPERTY(QStringList actions READ GetActions WRITE SetActions NOTIFY ActionsChanged REVISION 0)
    Q_PROPERTY(bool when READ IsEnabled WRITE SetEnabled NOTIFY EnabledChanged REVISION 0)

public:
    explicit ActionListener(QQuickItem* pParent = nullptr);
    virtual ~ActionListener();

    virtual void ActionTriggered(const QString& ActionName, const QJSValue& Data) override;

    Q_SIGNAL void triggered(const QString& action, const QJSValue& data);

    // QML property 'actionList' - specifies a list of actions to filter on.
    QStringList GetActions() const;
    void SetActions(const QStringList& Actions);
    Q_SIGNAL void ActionsChanged();

    // QML property 'when' - specifies when the item is enabled and receiving messages.
    bool IsEnabled() const;
    void SetEnabled(bool Enabled);
    Q_SIGNAL void EnabledChanged();

private:
    void _RegisterActions();
    void _DeregisterActions();

    QStringList m_Actions;
    bool m_Enabled;
};
