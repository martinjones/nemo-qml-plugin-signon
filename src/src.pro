TARGET = nemosignon
PLUGIN_IMPORT_PATH = org/nemomobile/signon

TEMPLATE = lib
CONFIG += qt plugin hide_symbols
equals(QT_MAJOR_VERSION, 4): QT += declarative
equals(QT_MAJOR_VERSION, 5): QT += qml

equals(QT_MAJOR_VERSION, 4): target.path = $$[QT_INSTALL_IMPORTS]/$$PLUGIN_IMPORT_PATH
equals(QT_MAJOR_VERSION, 5): target.path = $$[QT_INSTALL_QML]/$$PLUGIN_IMPORT_PATH
INSTALLS += target

qmldir.files += $$_PRO_FILE_PWD_/qmldir
qmldir.path +=  $$target.path
INSTALLS += qmldir

equals(QT_MAJOR_VERSION, 5): DEFINES += QT_VERSION_5 SIGNON_UI_NO_EMBED_WEBVIEW

CONFIG += link_pkgconfig
equals(QT_MAJOR_VERSION, 4): PKGCONFIG += libsignon-qt
equals(QT_MAJOR_VERSION, 5): PKGCONFIG += libsignon-qt5

SOURCES += \
           $$PWD/identityinterface.cpp \
           $$PWD/identitymanagerinterface.cpp \
           $$PWD/plugin.cpp \
           $$PWD/serviceaccountidentityinterface.cpp \
           $$PWD/sessiondatainterface.cpp

HEADERS += \
           $$PWD/identityinterface.h \
           $$PWD/identityinterface_p.h \
           $$PWD/identitymanagerinterface.h \
           $$PWD/serviceaccountidentityinterface.h \
           $$PWD/serviceaccountidentityinterface_p.h \
           $$PWD/sessiondatainterface.h

OTHER_FILES += signon.qdoc signon.qdocconf

!contains(DEFINES, SIGNON_UI_NO_EMBED_WEBVIEW) {
    QT += gui
    HEADERS += $$PWD/signonuicontainerinterface.h
    SOURCES += $$PWD/signonuicontainerinterface.cpp
}

MOC_DIR = $$PWD/../.moc
OBJECTS_DIR = $$PWD/../.obj
