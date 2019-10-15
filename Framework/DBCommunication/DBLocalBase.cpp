#include "DBLocalBase.h"
#include "FrameworkOwner.h"
#include "SystemFile/FileManagerBase.h"

static const QString DBTYPE = "QSQLITE";
static const QString DBNAME_DATA_MANAGEMENT = "LocalDB";
static const QString DBFILENAME_EXTENSION = ".db";
static const QString DBFILENAME_DATA_MANAGEMENT = DBNAME_DATA_MANAGEMENT + DBFILENAME_EXTENSION;
static const QString DBCON_DATA_MANAGEMENT = DBNAME_DATA_MANAGEMENT;
static const QString DBTBL_BDS_DATA = "tblData";

DBLocalBase::DBLocalBase(QObject* parent)
    : QObject(parent)
{
}

DBLocalBase::~DBLocalBase()
{
    if (m_dbBDSData.isOpen())
    {
        m_dbBDSData.close();
    }
}

bool DBLocalBase::createDB(QString dbName, QString tableName)
{
    if (dbName != "" && tableName != "")
    {
        // Initialize target page database
        QSqlDatabase::database(dbName, false).close();
        QSqlDatabase::removeDatabase(dbName);

        m_dbBDSData = QSqlDatabase::addDatabase(DBTYPE, DBCON_DATA_MANAGEMENT);
        m_dbBDSData.setDatabaseName(dbName);

        if (m_dbBDSData.isOpen() || m_dbBDSData.open())
        {
            if (!m_dbBDSData.tables().contains(tableName))
            {
                QSqlQuery query("", m_dbBDSData);
                query.exec("create table " + tableName + " (data varchar)");
            }
            m_dbBDSData.close();
        }
    }
    else
    {
        // Initialize target page database
        QSqlDatabase::database(DBCON_DATA_MANAGEMENT, false).close();
        QSqlDatabase::removeDatabase(DBCON_DATA_MANAGEMENT);

        m_dbBDSData = QSqlDatabase::addDatabase(DBTYPE, DBCON_DATA_MANAGEMENT);
        m_dbBDSData.setDatabaseName(DBFILENAME_DATA_MANAGEMENT);

        if (m_dbBDSData.isOpen() || m_dbBDSData.open())
        {
            if (!m_dbBDSData.tables().contains(DBTBL_BDS_DATA))
            {
                QSqlQuery query("", m_dbBDSData);
                query.exec("create table " + DBTBL_BDS_DATA + " (data varchar)");
            }
            m_dbBDSData.close();
        }
    }

    return true;
}

//bool DBLocalBase::addCrawledUrl(QString strData)
//{
//    if (m_dbBDSData.isOpen() || m_dbBDSData.open())
//    {
//        if (!m_dbBDSData.tables().contains(DBTBL_BDS_DATA))
//        {
//            QSqlQuery query("", m_dbBDSData);
//            query.exec("create table " + DBTBL_BDS_DATA + " (data varchar)");
//        }
//        QSqlQuery query("", m_dbBDSData);
//        query.prepare("INSERT INTO " + DBTBL_BDS_DATA + "(data) VALUES(:data)");
//        query.bindValue(":data", strData);
//        if (!query.exec())
//        {
//            FileManagerBase::addEventLog("add Crawled Url to database failed");
//            FileManagerBase::addEventLog("result: " + query.lastError().text());
//            return false;
//        }
//        m_dbBDSData.close();
//    }
//    else
//    {
//        FileManagerBase::addEventLog(DBTBL_BDS_DATA + " can not open");
//        FileManagerBase::addEventLog("result: " + m_dbBDSData.lastError().text());
//        return false;
//    }
//    return true;
//}

//bool DBLocalBase::hasCrawledUrl(QString strData)
//{
//    bool crawled = false;
//    if (m_dbBDSData.isOpen() || m_dbBDSData.open())
//    {
//        if (m_dbBDSData.tables().contains(DBTBL_BDS_DATA))
//        {
//            m_dbBDSData.transaction();
//            QString selectQuery = "SELECT * FROM " + DBTBL_BDS_DATA + " WHERE data = '" + strData + "'";

//            QSqlQuery query(selectQuery, m_dbBDSData);
//            if (query.exec())
//            {
//                QJsonDocument jsDoc;
//                QSqlRecord record = query.record();
//                int nColData = record.indexOf("data");
//                while (query.next())
//                {
//                    QString strTempData = query.value(nColData).toString();
//                    if (strTempData != "")
//                    {
//                        crawled = true;
//                        break;
//                    }
//                }
//            }
//            else
//            {
//                FileManagerBase::addEventLog("Load data from database failed for checking hasCrawledUrl");
//                FileManagerBase::addEventLog("result: " + query.lastError().text());
//            }
//            m_dbBDSData.commit();
//        }
//        else
//        {
//            FileManagerBase::addEventLog(DBTBL_BDS_DATA + " do not exist");
//            FileManagerBase::addEventLog("result: " + m_dbBDSData.lastError().text());
//        }
//    }

//    return crawled;
//}

//QStringList DBLocalBase::loadAllCrawledUrl(int numberOfRecord)
//{
//    QStringList lstBDS;
//    if (m_dbBDSData.isOpen() || m_dbBDSData.open())
//    {
//        if (m_dbBDSData.tables().contains(DBTBL_BDS_DATA))
//        {
//            m_dbBDSData.transaction();
//            QString selectQuery = "SELECT * FROM " + DBTBL_BDS_DATA + " LIMIT " + QString::number(numberOfRecord);
//            QSqlQuery query(selectQuery, m_dbBDSData);
//            if (query.exec())
//            {
//                QJsonDocument jsDoc;
//                QSqlRecord record = query.record();
//                int nColData = record.indexOf("data");
//                while (query.next())
//                {
//                    QJsonDocument jsTempDoc;
//                    QString strTempData = query.value(nColData).toString();
//                    QByteArray arrayResponse = strTempData.toUtf8();
//                    lstBDS.append(arrayResponse);
//                }
//            }
//            else
//            {
//                FileManagerBase::addEventLog("loadAllCrawledUrl from database failed");
//                FileManagerBase::addEventLog("result: " + query.lastError().text());
//            }
//            m_dbBDSData.commit();
//        }
//        else
//        {
//            FileManagerBase::addEventLog(DBTBL_BDS_DATA + " do not exist");
//            FileManagerBase::addEventLog("result: " + m_dbBDSData.lastError().text());
//        }
//    }

//    TRACE_LOG(lstBDS.count());
//    return lstBDS;
//}
