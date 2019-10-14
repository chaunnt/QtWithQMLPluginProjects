#pragma once

#include <QObject>

#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlError>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlRecord>
#include <QtSql/QSqlResult>

#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>

class DBLocalBase : public QObject
{
    Q_OBJECT
protected:
    QSqlDatabase m_dbBDSData;

public:
    explicit DBLocalBase(QObject* parent = nullptr);
    ~DBLocalBase();

    bool createDB(QString dbName = "", QString tableName = "");

};
