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
