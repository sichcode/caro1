import QtQuick 2.0

Item {
    ListModel {
        id: playerList
        ListElement {
            name: "Player 1"
            wins: "0"
            ties: "0"
            losses: "0"
        }
        ListElement {
            name: "Player 2"
            wins: "0"
            ties: "0"
            losses: "0"
        }
    }

    Column {
        spacing: 10
        ListView {
            width: 180; height: 200

            model: playerList
            delegate: Text {
                text: name + " has wins: " + wins + ", ties: " + ties + ", losses: " + losses
            }
        }

        Row {
            spacing: 10
            Rectangle {
                id: backToGame
                height: 20
                width: 130

                color: "orange"
                Text {
                    text: qsTr("Back to the Game")
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        gameWindow1.visible = true
                        playerInfo1.visible = false
                    }
                }
            }
            Rectangle {
                id: viewPlayerInfo
                height: 20
                width: 150
                color: "yellow"
                Text {
                    text: qsTr("Enter New Player")
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        gameWindow1.visible = false
                        playerInfo1.visible = false
                        userInput1.visible = true
                    }
                }
            }
        }
    }
}
