// ============================================================
// PLAYERS / LEADERBOARD - Edit this array to add/remove players
// ============================================================
// Fields:
//   rank          - Leaderboard position
//   name          - Player name
//   points        - Total points
//   hardestLevel  - Name of their hardest completion (optional)
// ============================================================

export interface Player {
  rank: number;
  name: string;
  points: number;
  hardestLevel?: string;
}

const players: Player[] = [
  { rank: 1, name: "SmellY", points: 1787, hardestLevel: "davidheavyballs" },
  { rank: 2, name: "icedagger!!", points: 1593, hardestLevel: "elementary for dxvid" },
  { rank: 3, name: "vvKyro", points: 1461, hardestLevel: "elementary for dxvid" },
  { rank: 4, name: "ballwizard", points: 1347, hardestLevel: "haunted david" },
  { rank: 5, name: "Ceaser", points: 247, hardestLevel: "Davids inferno" },
  { rank: 6, name: "Atlas", points: 231, hardestLevel: "Davids retray wave" },
  { rank: 7, name: "David", points: 0 },
];

export default players;
