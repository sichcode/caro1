#include "caromodel.h"

CaroModel::CaroModel(QObject *parent) : QObject(parent), m_currentPlayer(1), m_wins(0), m_losses(0), m_draws(0)
{
    resetBoard();
}

void CaroModel::resetBoard()
{
    m_board = QVector<QVector<int>>(10, QVector<int>(10, 0));
    m_currentPlayer = 1;
    emit currentPlayerChanged();
}

bool CaroModel::playMove(int row, int col)
{
    if (m_board[row][col] == 0)
    {
        m_board[row][col] = m_currentPlayer;
        int result = checkWinner();
        if (result != 0)
        {
            updateScore(result);
            emit gameFinished(result);
        }
        else
        {
            m_currentPlayer = 3 - m_currentPlayer;
            emit currentPlayerChanged();
        }
        return true;
    }
    return false;
}

int CaroModel::checkWinner()
{
    for (int row = 0; row < 10; ++row)
    {
        int count = 0;
        for (int col = 0; col < 10; ++col)
        {
            if (m_board[row][col] == m_currentPlayer)
                ++count;
            else
                count = 0;
            if (count == 5)
                return m_currentPlayer;
        }
    }

    for (int col = 0; col < 10; ++col)
    {
        int count = 0;
        for (int row = 0; row < 10; ++row)
        {
            if (m_board[row][col] == m_currentPlayer)
                ++count;
            else
                count = 0;
            if (count == 5)
                return m_currentPlayer;
        }
    }

    for (int startRow = 0; startRow < 6; ++startRow)
    {
        for (int startCol = 0; startCol < 6; ++startCol)
        {
            int count = 0;
            for (int i = 0; i < 5; ++i)
            {
                if (m_board[startRow + i][startCol + i] == m_currentPlayer)
                    ++count;
                else
                    count = 0;
                if (count == 5)
                    return m_currentPlayer;
            }
        }
    }

    for (int startRow = 0; startRow < 6; ++startRow)
    {
        for (int startCol = 4; startCol < 10; ++startCol)
        {
            int count = 0;
            for (int i = 0; i < 5; ++i)
            {
                if (m_board[startRow + i][startCol - i] == m_currentPlayer)
                    ++count;
                else
                    count = 0;
                if (count == 5)
                    return m_currentPlayer;
            }
        }
    }

    for (int row = 0; row < 10; ++row)
    {
        for (int col = 0; col < 10; ++col)
        {
            if (m_board[row][col] == 0)
                return 0;
        }
    }

    return 3;
}
