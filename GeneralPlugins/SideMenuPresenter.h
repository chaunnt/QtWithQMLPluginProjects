#pragma once

#include "SystemFunctions/SystemFunctionsOwner.h"

#include <QObject>

class SideMenuPresenter : public QObject
{
    Q_OBJECT

public:
    explicit SideMenuPresenter(QObject* parent = nullptr);
};
