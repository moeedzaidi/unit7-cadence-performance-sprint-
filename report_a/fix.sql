-- Report A: Your Top Songs This Year
-- Optimization: Composite index on user_id and played_at

-- Create an index to speed up filtering by listener and date range
CREATE INDEX IF NOT EXISTS idx_plays_user_played
ON plays (user_id, played_at);

-- Update PostgreSQL statistics
ANALYZE plays;

-- Optimized Report A query
SELECT s.song_id, s.title, COUNT(*) AS play_count
FROM plays p
JOIN songs s ON s.song_id = p.track_id
WHERE p.user_id = 1
  AND p.played_at >= '2025-01-01'
  AND p.played_at < '2026-01-01'
GROUP BY s.song_id, s.title
ORDER BY play_count DESC, s.song_id ASC
LIMIT 20;
