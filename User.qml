import QtQuick 2.0

Item {

    anchors.fill: parent
    Column {
        spacing: 10
        Row {
            spacing: 10
            Rectangle {
                height: 20
                width: 100
                color: "gray"
                Text {
                    id: name1
                    text: qsTr("Player 1: ")
                }
            }
            TextEdit {
                id: namePlayer1
                text: "Enter Player 1..."
            }
        }

        Row {
            spacing: 10
            Rectangle {
                color: "gray"
                height: 20
                width: 100
            Text {
                id: name2
                text: qsTr("Player 2: ")
            }
            }
            TextEdit {
                id: namePlayer2
                text: "Enter Player 2..."
            }
        }

        Rectangle {
            id: enterButton
            height: 20
            width: 150
            color: "orange"
            Text {
                text: qsTr("Enter New Game")
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    userInput1.visible = false
                    gameWindow1.visible = true
                }
            }
        }
    }
}
