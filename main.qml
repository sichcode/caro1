import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Window {
    visible: true
    width: 640
    height: 640
    title: qsTr("Caro Game")

    CaroController {
        id: caroController
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 10

        Text {
            text: caroController.m_model.currentPlayer === 1 ? "Player X" : "Player O"
            font.pixelSize: 24
        }

        GridView {
            id: gridView
            model: 100
            width: 500
            height: 500
            cellWidth: 50
            cellHeight: 50
            delegate: Rectangle {
                width: 48
                height: 48
                color: "white"
                border.color: "black"
                border.width: 1

                Text {
                    anchors.centerIn: parent
                    text: caroController.m_model.board[index / 10][index % 10] === 1 ? "X" : (caroController.m_model.board[index / 10][index % 10] === 2 ? "O" : "")
                    font.pixelSize: 32
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (caroController.playMove(index / 10, index % 10))
                            gridView.forceActiveFocus();
                    }
                }
            }
        }

        Text {
            text: "Wins: " + caroController.m_model.wins
            font.pixelSize: 24
        }

        Text {
            text: "Losses: " + caroController.m_model.losses
            font.pixelSize: 24
        }

        Text {
            text: "Draws: " + caroController.m_model.draws
            font.pixelSize: 24
        }

        Button {
            text: "Reset"
            onClicked: caroController.resetBoard()
        }
    }
}
