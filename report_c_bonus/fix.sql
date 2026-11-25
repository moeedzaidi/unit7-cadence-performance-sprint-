-- Bonus Report C: Your Recent Listening
-- Optimization: Covering index with INCLUDE

CREATE INDEX IF NOT EXISTS idx_plays_user_recent_cover
ON plays (user_id, played_at DESC)
INCLUDE (track_id);

ANALYZE plays;

-- Optimized query
SELECT p.played_at, s.title
FROM plays p
JOIN songs s ON s.song_id = p.track_id
WHERE p.user_id = 1
ORDER BY p.played_at DESC
LIMIT 50;
