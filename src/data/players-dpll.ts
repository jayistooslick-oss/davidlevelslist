// ============================================================
// DPLL PLAYERS / LEADERBOARD - Demon Point Levels List
// ============================================================

export interface DPLLPlayer {
  rank: number;
  name: string;
  points: number;
  hardestLevel?: string;
}

const dpllPlayers: DPLLPlayer[] = [
  { rank: 1, name: "CeasarWare", points: 200, hardestLevel: "free DAVID" },
];

export default dpllPlayers;
