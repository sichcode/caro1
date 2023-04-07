import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Caro Game")

    Loader {
        id: userInput1
        source: "User.qml"
        visible: true
    }

    Loader {
        id: gameWindow1
        source: "GameWindow.qml"
        visible: false
    }

    Loader {
        id: playerInfo1
        source: "PlayerInfo.qml"
        visible: false
    }

}
