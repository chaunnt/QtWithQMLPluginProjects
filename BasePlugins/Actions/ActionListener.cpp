#include "ActionListener.h"
#include "ActionDispatcher.h"

/*!
    \qmltype ActionListener

    \instantiates ActionListener
    \inqmlmodule LightHouse
    \inherits Item
    \ingroup lighthouse-actions

    \brief Listens for a given list of actions and emits the tiggered signal when they occur.

    This element allows us to receive actions that can be dispatched from any part of the system.
    It allows us to separate the source of the action (a button being clicked) from the place that
    the processing occurs.

    For example:

    \qml
        PushButton {
            onClicked: {
                Action.dispatch("someAction", { anyData: "Hello!", canGo: 5, here: true });
            }
        }
    \endqml

    ...could then be received and handled with this (in another module, if necessary):

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
    \qmlsignal ActionListener::triggered(string action, var data)

    This signal is emitted when an action is dispatched that this \l ActionListener
    specifies in its \l{ActionListener::actions}{actions list}. The \a action parameter
    gives the name of the action, and the \a data parameter gives a Javascript \c var with
    any data that was included in the action.
 */

/*!
    \class ActionListener
    \brief Listens for a given list of actions and emits the tiggered signal when they occur.
 */

/*!
    \brief Constructs a ActionListener with parent given by \a pParent.
 */
ActionListener::ActionListener(QQuickItem* pParent)
        : QQuickItem(pParent)
        , m_Actions()
        , m_Enabled(true)
{
}

/*!
    \brief Destructs a ActionListener.
 */
ActionListener::~ActionListener()
{
    _DeregisterActions();
}

void ActionListener::ActionTriggered(const QString& ActionName, const QJSValue& Data)
{
    if (m_Enabled)
    {
        // Pass the message on to the QML code.
        Q_EMIT triggered(ActionName, Data);
    }
}

/*!
    \qmlproperty stringlist ActionListener::actions

    The list of actions that the ActionListener will emit the \l{ActionListener::triggered}{triggered} signal for.
 */
/*!
    \property ActionListener::actions
    \brief Provides the QML-accessible property specifying the action list to filter on.
 */

QStringList ActionListener::GetActions() const
{
    return m_Actions;
}

void ActionListener::SetActions(const QStringList& Actions)
{
    if (Actions != m_Actions)
    {
        _DeregisterActions();  // Remove all the old actions.

        m_Actions = Actions;
        Q_EMIT ActionsChanged();

        _RegisterActions();    // Add in the new actions.
    }
}

/*!
    \qmlproperty bool ActionListener::when

    Specifies when the item is enabled and receiving messages.
 */
/*!
    \property ActionListener::when
    \brief Provides the QML-accessible property specifying the enablement of the element.
 */

bool ActionListener::IsEnabled() const
{
    return m_Enabled;
}

void ActionListener::SetEnabled(bool Enabled)
{
    if (Enabled != m_Enabled)
    {
        // Change the value before we start getting callbacks.
        m_Enabled = Enabled;
        Q_EMIT EnabledChanged();

        if (Enabled)
        {
            _RegisterActions();
        }
        else
        {
            _DeregisterActions();
        }
    }
}

void ActionListener::_RegisterActions()
{
    for (const QString& Action : m_Actions)
    {
        ActionDispatcher::AddListener(Action, this);
    }
}

void ActionListener::_DeregisterActions()
{
    for (const QString& Action : m_Actions)
    {
        ActionDispatcher::RemoveListener(Action, this);
    }
}
