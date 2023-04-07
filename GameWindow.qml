import QtQuick 2.0

Item {
    anchors.fill: parent
    property bool switchPlayerMovement: true
    Column {
        Row {
            spacing: 50
            Text {
                id: player1
                text: qsTr("Player 1 (X)")
                color: "red"
                font.pixelSize: 20
            }
            Text {
                id: player2
                text: qsTr("Player 2 (O)")
                font.pixelSize: 20
                color: "black"
            }
        }
        Grid {
            columns: 10
            Repeater {
                model: 100
                Rectangle {
                    id: rectange1
                    color: "blue"
                    width: 35
                    height: 35
                    border.color: "white"
                    border.width: 2
                    enabled: true
                    Text {
                        anchors.centerIn: parent
                        id: moveXorO
                        text: ""
                        color: "white"
                        font.pixelSize: 30
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            // if player 1 - X
                            // if player 2 - O
                            if (switchPlayerMovement == true && moveXorO.text == "") {
                                moveXorO.text = "X"
                                player1.color = "black"
                                player2.color = "red"
                                switchPlayerMovement = false
                            } else if (switchPlayerMovement == false && moveXorO.text == ""){
                                moveXorO.text = "O"
                                player2.color = "black"
                                player1.color = "red"
                                switchPlayerMovement = true
                            }
                        }
                    }

                }
            }
        }

        Row {
            spacing: 10
            Rectangle {
                id: newGameButton
                height: 20
                width: 90
                color: "orange"
                Text {
                    text: qsTr("New Game")
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        // newGameFunction
                    }
                }
            }
            Rectangle {
                id: viewPlayerInfo
                height: 20
                width: 120
                color: "yellow"
                Text {
                    text: qsTr("View Player Info")
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        gameWindow1.visible = false
                        playerInfo1.visible = true
                    }
                }
            }
        }
    }


}
