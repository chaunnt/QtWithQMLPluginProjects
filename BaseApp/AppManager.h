#pragma once

#include <QObject>

class AppManager : public QObject
{
    Q_OBJECT
public:
    explicit AppManager(QObject *parent = nullptr);
    void initApplication();
};

