import { useState } from 'react';
import { historyType } from '../types/historyType';
import { calculateWinner } from '../utils/calculateWinner';

export const useGameControl = () => {
  const [history, setHistory] = useState<Array<historyType>>([{squares: Array(9).fill(null)}]);
  const [stepNumber, setStepNumber] = useState<number>(0);
  const [xIsNext, setXIsNext] = useState<boolean>(true);

  const handleClickSquare = (i: number) => {
    const copiedHistory = history.slice(0, stepNumber + 1);
    const current = history[copiedHistory.length - 1];
    const squares = current.squares.slice();
    if (calculateWinner(squares) || squares[i]) {
      return;
    }
    squares[i] = xIsNext ? 'X' : 'O';
    setHistory(copiedHistory.concat([
      { squares: squares }
    ]));
    setStepNumber(copiedHistory.length);
    setXIsNext(!xIsNext);
  }

  const jumpToPast = (step: number) => {
    setStepNumber(step);
    setXIsNext((step % 2 === 0));
  }

  return { history, stepNumber, xIsNext, handleClickSquare, jumpToPast };
}