import levels from '../data/levels';

export type { Level, LevelRecord } from '../data/levels';
export type { Player } from '../data/players';
export type { Editor } from '../data/editors';

export function score(rank: number, percent: number = 100): number {
  if (rank > 150) return 0;
  if (rank > 75 && percent < 100) return 0;

  let s = (-24.9975 * Math.pow(rank - 1, 0.4) + 200) * (percent / 100);
  s = Math.max(0, s);

  if (percent !== 100) {
    return round(s - s / 3);
  }

  return Math.max(round(s), 0);
}

function round(num: number): number {
  const scale = 3;
  if (!('' + num).includes('e')) {
    return +(Math.round(Number(num + 'e+' + scale)) + 'e-' + scale);
  }
  const arr = ('' + num).split('e');
  const sig = +arr[1] + scale > 0 ? '+' : '';
  return +(
    Math.round(+arr[0] + 'e' + sig + (+arr[1] + scale)) + 'e-' + scale
  );
}

export function localize(num: number): string {
  return num.toLocaleString(undefined, { minimumFractionDigits: 3 });
}

export function getPointsForLevel(rank: number): number {
  return score(rank, 100);
}
