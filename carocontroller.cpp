#include "carocontroller.h"

CaroController::CaroController(QObject *parent) : QObject(parent)
{
    connect(&m_model, &CaroModel::currentPlayerChanged, this, &CaroController::currentPlayerChanged);
    connect(&m_model, &CaroModel::winsChanged, this, &CaroController::winsChanged);
    connect(&m_model, &CaroModel::lossesChanged, this, &CaroController::lossesChanged);
    connect(&m_model, &CaroModel::drawsChanged, this, &CaroController::drawsChanged);
    connect(&m_model, &CaroModel::gameFinished, this, &CaroController::onGameFinished);
}

void CaroController::resetBoard()
{
    m_model.resetBoard();
}

bool CaroController::playMove(int row, int col)
{
    return m_model.playMove(row, col);
}

void CaroController::onGameFinished(int result)
{
    emit gameFinished(result);
}
