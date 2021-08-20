import　{ VFC } from 'react';
import { squareProps } from '../types/squareType';

export const Square: VFC<squareProps> = (props) => {
    return (
      <button
        className="square"
        onClick={props.onClick}
      >
        {props.value}
      </button>
    );
}
