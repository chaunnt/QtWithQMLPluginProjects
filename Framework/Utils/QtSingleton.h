#pragma once

#include <QCoreApplication>

#include <functional>

/**
 * Singleton base class for a Qt object.
 *
 * Type T is the type of the singleton and should be a base of the class.
 *
 * The Qt object must provide:
 *  - A default constructor accessible to QtSingleton<T>;
 *  - A slot _onAboutToQuit, which forwards the call to QtSingleton<T>::onAboutToQuit.
 *
 *   class MyClass : private QtSingleton<MyClass> {
 *      Q_OBJECT
 *   public:
 *      using QtSingleton<MyClass>::getInstance;
 *      Q_SLOT _onAboutToQuit();
 *   }
 */
template<typename T, bool deleteLater = false>
class QtSingleton{
public:
    /**
     * @brief SystemFunctionsOwner::getInstance Singleton accessor function.
     * Import into the singleton class with using QtSingleton<T>::getInstance;
     * @return
     */
    static T* getInstance();

protected:
    /**
     * Assert that the only instance of class T is created via the singleton.
     * @brief QtSingleton
     */
    QtSingleton() = default;

    /**
     * Reduce visibility to subclass only.
     */
    ~QtSingleton();

    /**
     * Call this from subclass slot _onAboutToQuit.
     * @brief SystemFunctionsOwner::onAboutToQuit
     */
    void onAboutToQuit();

private:
    /**
     * Storage for singleton data.
     */
    struct StorageType {
        T *m_pInstance;   //< Pointer to the singleton instance.
        bool m_bDeleting; //< Flag indicating if the instance is being deleted.
    };

    /**
     * Provides common storage for singleton.
     * @brief getInstanceStorage Returns a reference to the storage data.
     * @param generator The generator to use to construct the singleton on first instantiaton.
     * @return Initialized storage.
     */
    static StorageType &getStorage(T*(*generator)());

    /**
     *
     * @brief getStorageNoInit Request storage but do not initialize.
     * @return Storage, without performing initialization.
     */
    static StorageType &getStorageNoInit();
};

template<typename T, bool deleteLater>
QtSingleton<T, deleteLater>::~QtSingleton()
{
    if (deleteLater)
    {
        auto &storage = getStorageNoInit();
        storage.m_bDeleting = true;
        storage.m_pInstance = nullptr;
    }
}

template<typename T, bool deleteLater>
T* QtSingleton<T, deleteLater>::getInstance()
{
    const auto &storage = getStorage(
        [] {
            T *const instance = new T;
            static_cast<T*>(instance)->connect(QCoreApplication::instance(), &QCoreApplication::aboutToQuit, instance, &T::_onAboutToQuit);
            return instance;
        });
    if (storage.m_bDeleting)
    {

    }
    return storage.m_pInstance;
}

template<typename T, bool deleteLater>
void QtSingleton<T, deleteLater>::onAboutToQuit()
{
    auto &storage = getStorageNoInit();
    if (storage.m_pInstance)
    {
        if /*constexpr*/ (deleteLater) 
        {
            storage.m_pInstance->deleteLater();
        } else {
            storage.m_bDeleting = true;
            delete storage.m_pInstance;
            storage.m_pInstance = nullptr;
        }
    }
}

template<typename T, bool deleteLater>
typename QtSingleton<T, deleteLater>::StorageType &QtSingleton<T, deleteLater>::getStorage(T*(*generator)())
{
    static StorageType instanceData = { generator(), false };
    return instanceData;
}

template<typename T, bool deleteLater>
typename QtSingleton<T, deleteLater>::StorageType &QtSingleton<T, deleteLater>::getStorageNoInit()
{
    return getStorage([] {
        return static_cast<T*>(nullptr);
    });
}

