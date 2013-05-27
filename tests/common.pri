include(../src/src.pro)
SRCDIR = ../../src/
INCLUDEPATH += $$SRCDIR
DEPENDPATH = $$INCLUDEPATH
QT += testlib
TEMPLATE = app
CONFIG -= app_bundle

CONFIG += link_pkgconfig
equals(QT_MAJOR_VERSION, 4): PKGCONFIG += libsignon-qt QtDeclarative
equals(QT_MAJOR_VERSION, 5): PKGCONFIG += libsignon-qt5 Qt5Qml

equals(QT_MAJOR_VERSION, 4): target.path = /opt/tests/nemo-qml-plugins/signon
equals(QT_MAJOR_VERSION, 5): target.path = /opt/tests/nemo-qml-plugins-qt5/signon
INSTALLS += target
