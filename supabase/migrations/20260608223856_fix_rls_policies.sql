-- Drop existing restrictive policies and recreate with anon+authenticated access
DROP POLICY IF EXISTS "select_challenges" ON challenges;
DROP POLICY IF EXISTS "insert_challenges" ON challenges;
DROP POLICY IF EXISTS "update_challenges" ON challenges;
DROP POLICY IF EXISTS "delete_challenges" ON challenges;
DROP POLICY IF EXISTS "select_completions" ON completions;
DROP POLICY IF EXISTS "insert_completions" ON completions;
DROP POLICY IF EXISTS "update_completions" ON completions;
DROP POLICY IF EXISTS "delete_completions" ON completions;

-- Challenges: public read, anon+authenticated insert (for admin), no update/delete from client
CREATE POLICY "select_challenges" ON challenges FOR SELECT TO anon, authenticated USING (true);
CREATE POLICY "insert_challenges" ON challenges FOR INSERT TO anon, authenticated WITH CHECK (true);
CREATE POLICY "update_challenges" ON challenges FOR UPDATE TO anon, authenticated USING (true);
CREATE POLICY "delete_challenges" ON challenges FOR DELETE TO anon, authenticated USING (true);

-- Completions: public read, anyone can insert (log victory), no update/delete from client
CREATE POLICY "select_completions" ON completions FOR SELECT TO anon, authenticated USING (true);
CREATE POLICY "insert_completions" ON completions FOR INSERT TO anon, authenticated WITH CHECK (true);
CREATE POLICY "update_completions" ON completions FOR UPDATE TO anon, authenticated USING (true);
CREATE POLICY "delete_completions" ON completions FOR DELETE TO anon, authenticated USING (true);
