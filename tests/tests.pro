TEMPLATE = subdirs
SUBDIRS = \
    tst_identityinterface \
    tst_serviceaccountidentityinterface

tests_xml.target = tests.xml
tests_xml.files = tests.xml
equals(QT_MAJOR_VERSION, 4): tests_xml.path = /opt/tests/nemo-qml-plugins/signon
equals(QT_MAJOR_VERSION, 5): tests_xml.path = /opt/tests/nemo-qml-plugins-qt5/signon
INSTALLS += tests_xml
