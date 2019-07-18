#ifndef SAMPLEMODULES_H
#define SAMPLEMODULES_H

#include <QQuickItem>

class SampleModules : public QQuickItem
{
    Q_OBJECT
    Q_DISABLE_COPY(SampleModules)

public:
    SampleModules(QQuickItem *parent = nullptr);
    ~SampleModules();
};

#endif // SAMPLEMODULES_H
