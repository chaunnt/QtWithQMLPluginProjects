#pragma once

#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QObject>

class SettingsManager : public QObject
{
    Q_OBJECT
public:
    explicit SettingsManager(QObject* parent = nullptr);

    bool loadHostSettings();
    bool loadAuthenticationSettings();

private:
    QJsonArray m_hostSettings;
};
