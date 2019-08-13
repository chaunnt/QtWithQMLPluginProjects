#include "ActionDispatcher.h"
#include "IActionListener.h"

#include <QMutexLocker>
#include <QJsonDocument>
#include <QVariant>
#include <QTime>

/*!
    \qmltype Action
    \instantiates ActionDispatcher
    \inherits QtObject
    \brief Queues and dispatches action messages to any registered listeners.

    This QML singleton is used to dispatch action messages, which can then be handled
    by \l ActionListener elements. For example:

    \qml
        PushButton {
            onClicked: {
                Action.dispatch("someAction", { anyData: "sampleData!", sampleProperty: 0 });
            }
        }
    \endqml

    ...could then be received and handled with this:

    \qml
        ActionListener {
            actions: [ "someAction" ]
            onTriggered: {
                console.log("Received action: " + action + ", with message: " + data.anyData);
            }
        }
    \endqml

    \sa {Action Dispatching and Handling}
 */

/*!
    \class IActionListener
    \brief An abstract interface used to receive callbacks whenever an action has been dispatched.

    This class provides an interface than can be used to allow C++ code to receive callbacks when
    actions are dispatched, even if they are dispatched from QML. In this case, the class implementing
    this interface should call \l{ActionDispatcher::AddListener}{AddListener} and
    \l{ActionDispatcher::RemoveListener}{RemoveListener}, probably from its constructor and destructor,
    with the name of the action to receive callbacks for.
 */

/*!
    \fn void IActionListener::ActionTriggered(const QString& ActionName, const QJSValue& Data)
    \brief Called when the action dispatcher receives an action that this object has requested callbacks for.

    When an object of a class that implements \l IActionListener has registered for callbacks on a
    specific action (using \l ActionDispatcher::AddListener), this method will be called when that
    action is dispatched. The action is specified by \a ActionName and can optionally have \a Data, which
    is a Javascript \c var type from the QML code that dispatched the action.
 */

QMutex ActionDispatcher::m_ListenerMutex;
QHash<QString, QList<IActionListener*> > ActionDispatcher::m_Listeners;

/*!
    \class ActionDispatcher
    \brief Queues and dispatches action messages to any registered listeners.
 */

/*!
    \brief Constructs an ActionDispatcher with parent given by \a pParent.
 */
ActionDispatcher::ActionDispatcher(QObject* pParent)
    : QObject(pParent)
    , m_MessageQueue()
    , m_DispatchInProgress(false)
{

}

/*!
    \brief Destroys an ActionDispatcher.
 */
ActionDispatcher::~ActionDispatcher()
{
}

/*!
    \brief Add a listener (\a pListener) for the given \a ActionName.

    This is a static method that can be called from C++ to register a listener
    with the action dispatcher. It is used by \l ActionListener to allow it
    to receive actions.
 */
void ActionDispatcher::AddListener(QString ActionName, IActionListener* pListener)
{
    QMutexLocker lock(&m_ListenerMutex);
    if (!m_Listeners.contains(ActionName) || !m_Listeners[ActionName].contains(pListener))
    {
        m_Listeners[ActionName].append(pListener);
    }
}

/*!
    \brief Removes a listener (\a pListener) for the given \a ActionName.

    This is a static method that can be called from C++ to deregister a listener
    with the action dispatcher. It is used by \l ActionListener to prevent it
    from receiving actions when it is disabled or destroyed.
 */
void ActionDispatcher::RemoveListener(QString ActionName, IActionListener* pListener)
{
    QMutexLocker lock(&m_ListenerMutex);
    if (m_Listeners.contains(ActionName) && m_Listeners[ActionName].contains(pListener))
    {
        m_Listeners[ActionName].removeAll(pListener);
        if (m_Listeners[ActionName].isEmpty())
        {
            m_Listeners.remove(ActionName);
        }
    }
}

/*!
    \qmlmethod void Action::addToLog(string logString)

    Takes as input qml strings in order to log some important qml actions.
 */
/*!
 * \brief Called from QML to log some actions worth to be logged.
 */
void ActionDispatcher::addToLog(QString logString)
{
    QTime time = QTime::currentTime();
    QString currentTime = time.toString(QString("hh:mm:ss.zzz"));
    logString = "Logging action: " + logString.trimmed();
}

/*!
    \qmlmethod void Action::dispatch(string action, var data)

    Dispatches an 'action' with the name given by the \a action parameter. These can be caught
    and handled with the \l ActionListener element and its \l{ActionListener::triggered}{triggered}
    signal.

    The optional \a data parameter is a Javascript \c var and can take any value (or set of values).

    \sa ActionListener
 */
/*!
    \brief Called from QML to dispatch the \a ActionName with the given \a Data.
 */
void ActionDispatcher::dispatch(QString ActionName, QJSValue Data)
{
    if (m_DispatchInProgress)
    {
        m_MessageQueue.enqueue(qMakePair(ActionName, Data));
    }
    else
    {
        // Block against dispatches that occur as a result of dispatching.
        m_DispatchInProgress = true;

        _DispatchMessage(ActionName, Data);

        // Deal with ongoing queue of messages that may build up from dispatches.
        while (!m_MessageQueue.empty())
        {
            QPair<QString, QJSValue> Message = m_MessageQueue.dequeue();
            _DispatchMessage(Message.first, Message.second);
        }

        m_DispatchInProgress = false;
    }
}

void ActionDispatcher::_DispatchMessage(const QString& ActionName, const QJSValue& Data)
{
    m_ListenerMutex.lock();
    if (m_Listeners.contains(ActionName))
    {
        // We are logging current time, ActionName and passed Data
        QTime time = QTime::currentTime();
        QString currentTime = time.toString(QString("hh:mm:ss.zzz"));
        QString logMessage = "Dispatching action: " + ActionName;
        QJsonDocument doc = QJsonDocument::fromVariant(Data.toVariant());
        if (!doc.toJson().isEmpty())
        {
            logMessage = logMessage + " with data " + doc.toJson();
        }
        logMessage = logMessage.trimmed();

        QList<IActionListener*> tempList(m_Listeners[ActionName]);
        m_ListenerMutex.unlock();

        for (IActionListener* pListener : tempList)
        {
            pListener->ActionTriggered(ActionName, Data);
        }
    }
    else
    {
        m_ListenerMutex.unlock();
    }
}
