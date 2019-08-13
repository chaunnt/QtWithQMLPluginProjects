#pragma once

#include <QHash>
#include <QList>
#include <QQueue>
#include <QPair>
#include <QString>
#include <QJSValue>
#include <QObject>
#include <QMutex>
#include <memory>

class IActionListener;
class UiEventLog;

class ActionDispatcher : public QObject
{
    Q_OBJECT

public:
    explicit ActionDispatcher(QObject* pParent = nullptr);
    virtual ~ActionDispatcher();

    // QML singleton, so we will never be using copy constructor or assignment.
    ActionDispatcher(const ActionDispatcher&) = delete;
    ActionDispatcher& operator=(const ActionDispatcher&) = delete;

    static void AddListener(QString ActionName, IActionListener* pListener);
    static void RemoveListener(QString ActionName, IActionListener* pListener);

    Q_INVOKABLE void addToLog(QString logString);
    Q_INVOKABLE void dispatch(QString ActionName, QJSValue Data = QJSValue());

private:
    void _DispatchMessage(const QString& ActionName, const QJSValue& Data);

    QQueue<QPair<QString, QJSValue>> m_MessageQueue;
    bool m_DispatchInProgress;

    static QMutex m_ListenerMutex;
    static QHash<QString, QList<IActionListener*>> m_Listeners;
    std::shared_ptr<UiEventLog> m_pUiEventLog;
};
