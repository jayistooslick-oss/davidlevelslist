-- Drop old tables and recreate with proper shitty list structure
DROP TABLE IF EXISTS completions;
DROP TABLE IF EXISTS challenges;

CREATE TABLE levels (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  rank INTEGER NOT NULL,
  name TEXT NOT NULL,
  level_id BIGINT NOT NULL,
  author TEXT NOT NULL,
  creators TEXT[] DEFAULT '{}',
  verifier TEXT NOT NULL,
  verification TEXT, -- YouTube URL for verification video
  showcase TEXT, -- YouTube URL for showcase video (optional)
  percent_to_qualify INTEGER NOT NULL DEFAULT 100,
  password TEXT DEFAULT 'Not Copyable',
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE records (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  level_id UUID NOT NULL REFERENCES levels(id) ON DELETE CASCADE,
  player_name TEXT NOT NULL,
  link TEXT, -- YouTube URL for record proof
  percent INTEGER NOT NULL DEFAULT 100,
  hz INTEGER NOT NULL DEFAULT 60,
  mobile BOOLEAN NOT NULL DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE editors (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  role TEXT NOT NULL CHECK (role IN ('owner', 'admin', 'helper', 'trial', 'dev')),
  name TEXT NOT NULL,
  link TEXT
);

ALTER TABLE levels ENABLE ROW LEVEL SECURITY;
ALTER TABLE records ENABLE ROW LEVEL SECURITY;
ALTER TABLE editors ENABLE ROW LEVEL SECURITY;

CREATE POLICY "select_levels" ON levels FOR SELECT TO anon, authenticated USING (true);
CREATE POLICY "insert_levels" ON levels FOR INSERT TO anon, authenticated WITH CHECK (true);
CREATE POLICY "update_levels" ON levels FOR UPDATE TO anon, authenticated USING (true);
CREATE POLICY "delete_levels" ON levels FOR DELETE TO anon, authenticated USING (true);

CREATE POLICY "select_records" ON records FOR SELECT TO anon, authenticated USING (true);
CREATE POLICY "insert_records" ON records FOR INSERT TO anon, authenticated WITH CHECK (true);
CREATE POLICY "update_records" ON records FOR UPDATE TO anon, authenticated USING (true);
CREATE POLICY "delete_records" ON records FOR DELETE TO anon, authenticated USING (true);

CREATE POLICY "select_editors" ON editors FOR SELECT TO anon, authenticated USING (true);
CREATE POLICY "insert_editors" ON editors FOR INSERT TO anon, authenticated WITH CHECK (true);
CREATE POLICY "update_editors" ON editors FOR UPDATE TO anon, authenticated USING (true);
CREATE POLICY "delete_editors" ON editors FOR DELETE TO anon, authenticated USING (true);

-- Seed editors
INSERT INTO editors (role, name, link) VALUES
('owner', 'List Owner', NULL),
('admin', 'List Admin', NULL),
('dev', 'List Coder', NULL);

-- Seed a few sample levels (user will tell us what to put)
INSERT INTO levels (rank, name, level_id, author, creators, verifier, verification, percent_to_qualify, password) VALUES
(1, 'Shitty Agile', 66602509, 'v1nnyy', '{}', 'Magmeta', 'https://www.youtube.com/watch?v=example1', 100, 'Not Copyable'),
(2, 'Shitty Aftermath', 70768290, 'Partu', '{}', 'Partu', 'https://www.youtube.com/watch?v=example2', 100, 'Not Copyable'),
(3, 'Shitty Apocalyptic', 66056810, 'neigtsuu', '{}', 'neigtsuu', 'https://www.youtube.com/watch?v=example3', 100, 'Free to Copy');
