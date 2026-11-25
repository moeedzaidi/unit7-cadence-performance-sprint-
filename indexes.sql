-- EX603 Unit 7: Cadence Performance Sprint
-- Indexes retained for query performance

-- Starting setup index: supports queries that filter or search by played_at.
CREATE INDEX IF NOT EXISTS idx_plays_played_at
ON plays (played_at);

-- Report A: Speeds up filtering plays by listener and date range together.
CREATE INDEX IF NOT EXISTS idx_plays_user_played
ON plays (user_id, played_at);



-- Report B: Supports filtering plays by the December 2025 date range.
-- Used by the optimized timestamp range condition in Report B.
CREATE INDEX IF NOT EXISTS idx_plays_played_at
ON plays (played_at);




-- Bonus Report C: Covers user_id, played_at and track_id.
-- Enables Index Only Scan for recent listening queries.
CREATE INDEX IF NOT EXISTS idx_plays_user_recent_cover
ON plays (user_id, played_at DESC)
INCLUDE (track_id);
