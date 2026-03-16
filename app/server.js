require('dotenv').config();
const express = require('express');
const mysql = require('mysql2/promise');
const cors = require('cors');
const path = require('path');

const app = express();
app.use(cors());
app.use(express.static(path.join(__dirname, 'public')));

const dbConfig = {
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
};

async function query(proc, params = []) {
  const conn = await mysql.createConnection(dbConfig);
  const placeholders = params.map(() => '?').join(', ');
  const sql = `CALL ${proc}(${placeholders})`;
  const [rows] = await conn.execute(sql, params);
  await conn.end();
  return rows[0]; // stored procedures return results in rows[0]
}

app.get('/api/top-rated',          async (_, res) => res.json(await query('GetTopRatedMovies')));
app.get('/api/by-genre/:genre',    async (req, res) => res.json(await query('GetMoviesByGenre', [req.params.genre])));
app.get('/api/highly-rated-genre', async (_, res) => res.json(await query('GetHighlyRatedMoviesByGenre')));
app.get('/api/avg-by-genre',       async (_, res) => res.json(await query('GetAverageRatingByGenre')));
app.get('/api/trending',           async (_, res) => res.json(await query('GetTrendingMovies')));
app.get('/api/most-rated-users',   async (_, res) => res.json(await query('GetMoviesRatedByMostUsers')));

app.listen(process.env.PORT || 3000, () => console.log(`Server running on http://localhost:${process.env.PORT || 3000}`));
