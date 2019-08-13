#include <QDateTime>
#include <QObject>
#include <QSound>
#include <QTimer>
#include <qqml.h>

class SamplePluginsPresenter : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int m_newProperty READ getNewProperty WRITE setNewProperty NOTIFY newPropertyChanged)
    Q_PROPERTY(NewEnum_t newEnum READ getNewEnum NOTIFY newEnumChanged)
public:
    enum NewEnum_t
    {
        NoSignal,
        TurnLeft,
        TurnRight,
        Hold
    };
    Q_ENUM(NewEnum_t)

    explicit SamplePluginsPresenter(QObject* parent = nullptr);
    virtual ~SamplePluginsPresenter();

    NewEnum_t getNewEnum();
    Q_SIGNAL void newEnumChanged();

    int getNewProperty();
    void setNewProperty(int newValue);
    Q_SIGNAL void newPropertyChanged();

private:
    NewEnum_t m_newEnum;
    int m_newProperty;
};
