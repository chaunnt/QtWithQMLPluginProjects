#pragma once

#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QObject>

class ProfileSettingManager : public QObject
{
    Q_OBJECT
public:
    explicit ProfileSettingManager(QObject* parent = nullptr);

    QString getUserName();
    QString getPassword();
private:
    QJsonArray m_profileSettings;
};
