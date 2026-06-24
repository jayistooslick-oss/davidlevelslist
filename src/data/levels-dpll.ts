// ============================================================
// DPLL LEVELS - Demon Point Levels List
// ============================================================

export interface DPLLLevelRecord {
  player: string;
  percent: number;
  hz: number | 'CBF';
  mobile: boolean;
  link: string;
}

export interface DPLLLevel {
  id: number;
  name: string;
  verifier: string;
  method: string;
  gdLevelId: number;
  videoUrl: string;
  records: DPLLLevelRecord[];
}

const dpllLevels: DPLLLevel[] = [
  { id: 1, name: "free DAVID", verifier: "CeasarWare", method: "N", gdLevelId: 0, videoUrl: "", records: [] },
];

export default dpllLevels;
