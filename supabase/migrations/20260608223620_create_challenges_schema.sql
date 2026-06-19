CREATE TABLE challenges (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  rank INTEGER NOT NULL,
  name TEXT NOT NULL,
  creator TEXT NOT NULL,
  difficulty TEXT NOT NULL CHECK (difficulty IN ('easy', 'medium', 'hard', 'insane', 'demon', 'extreme')),
  stars INTEGER NOT NULL DEFAULT 1,
  level_id BIGINT,
  description TEXT,
  video_url TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE completions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  challenge_id UUID NOT NULL REFERENCES challenges(id) ON DELETE CASCADE,
  player_name TEXT NOT NULL,
  completed_at TIMESTAMPTZ DEFAULT now()
);

ALTER TABLE challenges ENABLE ROW LEVEL SECURITY;
ALTER TABLE completions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "select_challenges" ON challenges FOR SELECT TO authenticated USING (true);
CREATE POLICY "insert_challenges" ON challenges FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "update_challenges" ON challenges FOR UPDATE TO authenticated USING (true);
CREATE POLICY "delete_challenges" ON challenges FOR DELETE TO authenticated USING (true);

CREATE POLICY "select_completions" ON completions FOR SELECT TO authenticated USING (true);
CREATE POLICY "insert_completions" ON completions FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "update_completions" ON completions FOR UPDATE TO authenticated USING (true);
CREATE POLICY "delete_completions" ON completions FOR DELETE TO authenticated USING (true);

-- Seed data: The "shitty list" style challenges
INSERT INTO challenges (rank, name, creator, difficulty, stars, level_id, description) VALUES
(1, 'Bloodbath', 'Riot', 'extreme', 10, 1142951, 'The iconic extreme demon that started it all'),
(2, 'Yatagarasu', 'Viprin', 'extreme', 10, 759226, 'The symbol of the divine challenge list'),
(3, 'The Golden', 'BoBo', 'demon', 10, 75557106, 'Golden times await those who dare'),
(4, 'Sonic Wave', 'Sunix', 'extreme', 10, 11371191, 'Ride the wave if you can survive it'),
(5, 'Acheron', 'Ryder', 'extreme', 10, 87480256, 'The river of pain flows deep'),
(6, 'Tartarus', 'Auxo', 'extreme', 10, 104763476, 'Welcome to the deepest circle'),
(7, 'Gangster Skull', 'Zenternal', 'demon', 10, 94823647, 'Not your average skull'),
(8, 'Nihil', 'Zoink', 'extreme', 10, 107636101, 'Nothing matters but beating this level'),
(9, 'Firework', 'Viprin', 'demon', 10, 94823778, 'Light up the sky with your failures'),
(10, 'Crimson Planet', 'Benny', 'extreme', 10, 64405220, 'The reddest planet in the galaxy'),
(11, 'Phosphene', 'Zoink', 'insane', 9, 105421874, 'See the light at the end of the tunnel'),
(12, 'DeCode', 'Recusor', 'demon', 10, 34276452, 'Can you crack the code?'),
(13, 'BuTi Ya', 'NaTu', 'hard', 7, 82542965, 'But why though?'),
(14, 'Problematic', 'Zoink', 'insane', 9, 85432196, 'Everything is problematic here'),
(15, 'Artificial Ascent', 'Viprin', 'demon', 10, 74997629, 'Rise above the rest'),
(16, 'Infernity', 'Bitfire', 'demon', 10, 62301164, 'Infinite inferno awaits'),
(17, 'Stellar', 'AbstractDark', 'hard', 7, 50292821, 'Reach for the stars'),
(18, 'Sunset Sandstorm', 'QETR', 'medium', 5, 6501843, 'Sand in your eyes, level on your mind'),
(19, 'Digital Descent', 'Viprin', 'demon', 10, 96074368, 'Fall through the digital void'),
(20, 'Theory of Everything 2', 'DJ-Nate', 'insane', 8, 3743, 'The sequel that breaks all theories'),
(21, 'Fingerdash', 'Zenthicalpha', 'hard', 6, 2744, 'Dash with your fingers, lose your mind'),
(22, 'Deadlocked', 'RobTop', 'demon', 10, 5140, 'Locked in and there is no way out'),
(23, 'Clubstep', 'RobTop', 'demon', 10, 3267, 'Step into the club of demons'),
(24, 'Cyclone', 'Nexus', 'medium', 5, 82357614, 'Spinning out of control'),
(25, 'Electrodynamix', 'RobTop', 'hard', 6, 4783, 'Electric boogaloo but deadly'),
(26, 'Blast Processing', 'RobTop', 'medium', 5, 2551, 'Process this blast to the face'),
(27, 'Geometrical Dominator', 'RobTop', 'hard', 6, 4839, 'Dominate or be dominated'),
(28, 'Hexagon Force', 'RobTop', 'hard', 6, 2324, 'The force is hexagonal in nature'),
(29, 'Fingerdash 2', 'RobTop', 'insane', 8, 7381, 'They made a sequel. It is worse.'),
(30, 'Toe2', 'DJ-Nate', 'insane', 8, 3744, 'Theory of Everything 2 is the worst name'),
(31, 'Can we call this a challenge', 'Gabe', 'easy', 3, 98761234, 'Can we? CAN WE?!'),
(32, 'DJ-Nate Simulator', 'DJ-Nate', 'easy', 2, 42424242, 'Just press play and watch'),
(33, 'Auto but it hurts', 'RobTop', 'easy', 2, 11111111, 'It auto completes but you still suffer'),
(34, 'Stereo Madness but worse', 'RandomPlayer', 'easy', 1, 1, 'Somehow worse than the original'),
(35, 'Polargeist Reloaded', 'IceCream', 'medium', 4, 45632178, 'The polar ghost returns angrier'),
(36, 'Back on Track (off the rails)', 'Derail', 'easy', 2, 7452, 'Off the track and into the void'),
(37, 'Dry Out (wet)', 'Aquaman', 'easy', 2, 5431, 'It is dry but also wet somehow'),
(38, 'Base after base', 'Noob', 'medium', 4, 2341, 'Base after base of suffering'),
(39, 'Cant Let Go', 'GF', 'medium', 4, 6752, 'Cannot let go of this level'),
(40, 'Jumper (cannot jump)', 'Troll', 'hard', 6, 3847, 'You cannot jump. Good luck.'),
(41, 'Time Machine (no time)', 'Chrono', 'hard', 7, 4821, 'No time to beat this level'),
(42, 'Cycles (unicycle)', 'OneWheel', 'medium', 5, 5832, 'Only one wheel. One chance.'),
(43, 'xStep (step off)', 'StepDad', 'hard', 6, 6723, 'Step off the platform into oblivion'),
(44, 'Clutterfunk (clean)', 'NeatFreak', 'hard', 7, 7342, 'The clean version somehow harder'),
(45, 'Stripped Down', 'Naked', 'insane', 8, 87612, 'Everything stripped but the pain'),
(46, 'Problematic 2', 'Zoink', 'insane', 9, 91234876, 'Still problematic, now with sequels'),
(47, 'Ultra Paracosm', 'Paracosm', 'extreme', 10, 83217654, 'Dream world becomes nightmare'),
(48, 'Rift', 'Exort', 'demon', 10, 76213498, 'The rift between skill and suffering'),
(49, 'Reanimation', 'G4ll4x', 'demon', 10, 94352167, 'Come back from the dead, die again'),
(50, 'Supersonic', 'ZenthicAlpha', 'extreme', 10, 61452983, 'Too fast too furious too geometric');
