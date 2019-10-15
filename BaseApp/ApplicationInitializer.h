#pragma once

#include <QObject>

class ApplicationInitializer : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int initProcess READ getInitProcess WRITE setInitProcess NOTIFY initProcessChanged)
    Q_PROPERTY(QString initMessage READ getInitMessage WRITE setInitMessage NOTIFY initMessageChanged)

public:

    explicit ApplicationInitializer(QObject *parent = nullptr);

    Q_INVOKABLE void startStartupSequence();
    Q_INVOKABLE void initializeApplication();

    Q_SIGNAL void initFinished();

    QString getInitMessage();
    void setInitMessage(QString newValue);
    Q_SIGNAL void initMessageChanged();

    int getInitProcess();
    void setInitProcess(int newValue);
    Q_SIGNAL void initProcessChanged();
private:
    QString m_InitMessage;
    int m_InitProcess;

    void _finializedStartup();
};
