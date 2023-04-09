#ifndef CAROCONTROLLER_H
#define CAROCONTROLLER_H

#include <QObject>
#include "caromodel.h"

class CaroController : public QObject
{
    Q_OBJECT

public:
    explicit CaroController(QObject *parent = nullptr);

    Q_INVOKABLE void resetBoard();
    Q_INVOKABLE bool playMove(int row, int col);

signals:
    void currentPlayerChanged();
    void winsChanged();
    void lossesChanged();
    void drawsChanged();
    void gameFinished(int result);

private:
    CaroModel m_model;

private slots:
    void onGameFinished(int result);
};

#endif // CAROCONTROLLER_H
