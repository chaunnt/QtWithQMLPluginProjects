#pragma once

#include <QObject>
#include <QXmlStreamReader>
#include <QXmlStreamWriter>
#include <QTextStream>

class FileManagerBase : public QObject
{
    Q_OBJECT
public:
    explicit FileManagerBase(QObject *parent = nullptr);

    void saveLoginWithEmail(QString strEmail, QString strPassword);
    void getLoginByEmail(QString &strEmail, QString &strPassword);

    void saveLoginWithPhone(QString strPhoneNumber, QString strPassword);
    void getLoginByPhone(QString &strPhoneNumber, QString &strPassword);

    static void addEventLog(QString strLog);

};

