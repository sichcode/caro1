#ifndef CAROMODEL_H
#define CAROMODEL_H

#include <QObject>
#include <QVector>

class CaroModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int currentPlayer READ currentPlayer NOTIFY currentPlayerChanged)
    Q_PROPERTY(int wins READ wins NOTIFY winsChanged)
    Q_PROPERTY(int losses READ losses NOTIFY lossesChanged)
    Q_PROPERTY(int draws READ draws NOTIFY drawsChanged)

public:
    explicit CaroModel(QObject *parent = nullptr);

    int currentPlayer() const;
    int wins() const;
    int losses() const;
    int draws() const;

public slots:
    void resetBoard();
    bool playMove(int row, int col);
    void updateScore(int result);

signals:
    void currentPlayerChanged();
    void winsChanged();
    void lossesChanged();
    void drawsChanged();
    void gameFinished(int result);

private:
    QVector<QVector<int>> m_board;
    int m_currentPlayer;
    int m_wins;
    int m_losses;
    int m_draws;

    int checkWinner();
};

#endif // CAROMODEL_H
