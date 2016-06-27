TEMPLATE = app
TARGET = QSanguosha
QT += qml quick multimedia
CONFIG += c++11

SOURCES += src/main.cpp \
    src/client/client.cpp \
    src/client/clientplayer.cpp \
    src/client/clientskill.cpp \
    src/core/card.cpp \
    src/core/cardarea.cpp \
    src/core/cardpattern.cpp \
    src/core/engine.cpp \
    src/core/gamemode.cpp \
    src/core/general.cpp \
    src/core/package.cpp \
    src/core/player.cpp \
    src/core/protocol.cpp \
    src/core/skill.cpp \
    src/core/datavalue.cpp \
    src/core/util.cpp \
    src/gamelogic/gamelogicqml.cpp \
    src/gamelogic/serverplayer.cpp \
    src/gui/dialog/pcconsolestartdialog.cpp \
    src/gui/dialog/startserverdialog.cpp \
    src/gui/dialog/startgamedialog.cpp \
    src/gui/gamelogger.cpp \
    src/gui/lobby.cpp \
    src/gui/roomscene.cpp \
    src/mode/hegemonymode.cpp \
    src/mode/standardmode.cpp \
    src/server/roomsettings.cpp \
    src/server/server.cpp \
    src/package/systempackage.cpp

HEADERS += \
    src/client/client.h \
    src/client/clientplayer.h \
    src/client/clientskill.h \
    src/core/card.h \
    src/core/cardarea.h \
    src/core/cardpattern.h \
    src/core/engine.h \
    src/core/gamemode.h \
    src/core/general.h \
    src/core/package.h \
    src/core/player.h \
    src/core/protocol.h \
    src/core/skill.h \
    src/core/datavalue.h \
    src/core/util.h \
    src/mode/hegemonymode.h \
    src/mode/standardmode.h \
    src/gamelogic/gamelogicqml.h \
    src/gamelogic/serverplayer.h \
    src/gui/dialog/pcconsolestartdialog.h \
    src/gui/dialog/startserverdialog.h \
    src/gui/dialog/startgamedialog.h \
    src/gui/gamelogger.h \
    src/gui/lobby.h \
    src/gui/roomscene.h \
    src/server/roomsettings.h \
    src/server/server.h \
    src/package/systempackage.h

INCLUDEPATH += src \
    src/client \
    src/core \
    src/gamelogic \
    src/gui \
    src/package \
    src/server

defineTest(copy) {
    file = $$1
    path = $$2
    !exists($$file): return(false)
    system("$$QMAKE_COPY $$system_path($$file) $$system_path($$path)")

    return(true)
}

win32 {
    RC_FILE = src/resource/icons/icon.rc
    QMAKE_LFLAGS_RELEASE = $$QMAKE_LFLAGS_RELEASE_WITH_DEBUGINFO
}

macx {
    ICON = src/resource/icons/icon.icns
}

android{
    QT += androidextras
    CONFIG += embedresource
}

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = $$PWD

QML_FILES = \
    script/Client/ClientSettings.qml \
    script/Gui/Splash.qml \
    script/Gui/StartScene.qml \
    script/Gui/Lobby.qml \
    script/Gui/Dialog/PcConsoleStartDialog.qml \
    script/Gui/Dialog/StartGameDialog.qml \
    script/Gui/Dialog/StartServerDialog.qml \
    script/Gui/RoomScene.qml \
    script/Gui/RoomElement/ArrangeCardBox.qml \
    script/Gui/RoomElement/CardArea.qml \
    script/Gui/RoomElement/CardItem.qml \
    script/Gui/RoomElement/ChatBox.qml \
    script/Gui/RoomElement/ChooseCardBox.qml \
    script/Gui/RoomElement/ChooseGeneralBox.qml \
    script/Gui/RoomElement/ChooseOptionBox.qml \
    script/Gui/RoomElement/Dashboard.qml \
    script/Gui/RoomElement/DelayedTrickArea.qml \
    script/Gui/RoomElement/EquipArea.qml \
    script/Gui/RoomElement/EquipItem.qml \
    script/Gui/RoomElement/GameOverBox.qml \
    script/Gui/RoomElement/GeneralAvatar.qml \
    script/Gui/RoomElement/GeneralCardItem.qml \
    script/Gui/RoomElement/GlowText.qml \
    script/Gui/RoomElement/GraphicsBox.qml \
    script/Gui/RoomElement/HandcardArea.qml \
    script/Gui/RoomElement/HandcardNumber.qml \
    script/Gui/RoomElement/HpBar.qml \
    script/Gui/RoomElement/IndicatorLine.qml \
    script/Gui/RoomElement/InvisibleCardArea.qml \
    script/Gui/RoomElement/IrregularButton.qml \
    script/Gui/RoomElement/KingdomBox.qml \
    script/Gui/RoomElement/LogBox.qml \
    script/Gui/RoomElement/Magatama.qml \
    script/Gui/RoomElement/RoleComboBox.qml \
    script/Gui/RoomElement/Photo.qml \
    script/Gui/RoomElement/PixmapAnimation.qml \
    script/Gui/RoomElement/PlayerCardBox.qml \
    script/Gui/RoomElement/ProgressBar.qml \
    script/Gui/RoomElement/Prompt.qml \
    script/Gui/RoomElement/SimpleEquipArea.qml \
    script/Gui/RoomElement/SimpleEquipItem.qml \
    script/Gui/RoomElement/SimpleKingdomIcon.qml \
    script/Gui/RoomElement/SkillButton.qml \
    script/Gui/RoomElement/SkillPanel.qml \
    script/Gui/RoomElement/TablePile.qml \
    script/engine.js \
    script/utility.js \
    script/main.qml \
    script/Ai/smart-ai.js \
    script/Ai/jsscript2.js \
    script/Package/Packages.json \
    script/Package/standard_cards/standard_cards.js \
    script/Package/nos_standard/nos_standard.js \
    script/Package/hegemony/hegemony.js \
    script/Package/hegemony_cards/hegemony_cards.js \
    script/Server/qmldir \
    script/Server/Event.qml \
    script/Server/EventHandler.qml \
    script/Server/GameRule.qml \
    script/Server/LogicMain.qml

# Embed some essential system resources
embedresource{
    !build_pass{
        defineTest(generate_qrc){
            qrc_path = $$1
            qrc_contents = $$2

            resource_content = \
                "<RCC>" \
                "    <qresource prefix=\"/\">"

            for(resource_file, qrc_contents) {
                resource_content += "        <file>$$relative_path($$resource_file)</file>"
            }

            resource_content += \
                "    </qresource>" \
                "</RCC>"

            write_file($$qrc_path, resource_content) | error("Aborting.")
        }

        generate_qrc("qml.qrc", $$QML_FILES)

        equals(QMAKE_HOST.os, Windows): MCD_LS = "dir /A:-D /B /S \"image/system\""
        equals(QMAKE_HOST.os, Linux): MCD_LS = "find \"image/system\" -type f"
        defined(MCD_LS, var): generate_qrc("image.qrc", $$system($$MCD_LS))
    }

    RESOURCES += \
        image.qrc \
        qml.qrc
    DEFINES += EMBED_RESOURCE
}

lupdate_only {
    SOURCES += $$QML_FILES
}
QML_FILES =

TRANSLATIONS += \
    translations/zh_CN.ts \
    translations/en_US.ts

OTHER_FILES += src/resource/android/AndroidManifest.xml

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/src/resource/android

# Default rules for deployment.
include(deployment.pri)

# Cardirector
DEFINES += MCD_STATIC
INCLUDEPATH += Cardirector/include
LIBS += -L$$PWD/Cardirector/lib -lCardirector -loggvorbis
CONFIG(release, debug|release): LIBS += -lbreakpad

