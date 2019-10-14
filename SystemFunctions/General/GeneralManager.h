#pragma once

#include <QObject>

class GeneralManager : public QObject
{
    Q_OBJECT
public:
    explicit GeneralManager(QObject* parent = nullptr);

};
