const BASE = 'http://localhost:3000/api';

const BLUE_PALETTE = ['#2563eb', '#3b82f6', '#60a5fa', '#93c5fd', '#bfdbfe'];

async function fetchJSON(url) {
  const res = await fetch(url);
  if (!res.ok) throw new Error(res.statusText);
  return res.json();
}

// ── Top Rated → horizontal bar ──────────────────────────────────────────────
async function loadTopRated() {
  const data = await fetchJSON(`${BASE}/top-rated`);
  const options = {
    chart: { type: 'bar', height: 260, toolbar: { show: false } },
    plotOptions: { bar: { horizontal: true, borderRadius: 4 } },
    series: [{ name: 'Avg Rating', data: data.map(r => parseFloat(r.average_rating).toFixed(2)) }],
    xaxis: { categories: data.map(r => r.title), labels: { style: { fontSize: '11px' } } },
    colors: ['#2563eb'],
    dataLabels: { enabled: false },
    tooltip: { y: { formatter: v => `⭐ ${v}` } },
    grid: { borderColor: '#f3f4f6' },
  };
  new ApexCharts(document.getElementById('chart-top-rated'), options).render();
}

// ── By Genre → search card with list ────────────────────────────────────────
async function fetchByGenre() {
  const genre = document.getElementById('genre-input').value.trim() || 'Action';
  const el = document.getElementById('by-genre');
  el.innerHTML = '<p class="text-gray-400 text-xs">Loading...</p>';
  try {
    const data = await fetchJSON(`${BASE}/by-genre/${encodeURIComponent(genre)}`);
    if (!data.length) { el.innerHTML = '<p class="text-gray-400 text-xs">No results found.</p>'; return; }
    el.innerHTML = data.map((r, i) =>
      `<div class="flex items-center gap-3 py-2 border-b border-gray-100 last:border-0">
        <span class="text-xs font-semibold text-blue-600 w-5">${i + 1}</span>
        <span class="text-sm text-gray-700">${r.title}</span>
      </div>`
    ).join('');
  } catch (e) {
    el.innerHTML = `<p class="text-red-400 text-xs">Error: ${e.message}</p>`;
  }
}

// ── Highly Rated by Genre → bar with genre labels ────────────────────────────
async function loadHighlyRated() {
  const data = await fetchJSON(`${BASE}/highly-rated-genre`);
  const options = {
    chart: { type: 'bar', height: 260, toolbar: { show: false } },
    plotOptions: { bar: { borderRadius: 4, columnWidth: '60%' } },
    series: [{ name: 'Avg Rating', data: data.map(r => parseFloat(r.average_rating).toFixed(2)) }],
    xaxis: { categories: data.map(r => `${r.title} (${r.genre})`), labels: { style: { fontSize: '10px' }, rotate: -30 } },
    colors: ['#2563eb'],
    dataLabels: { enabled: false },
    tooltip: { y: { formatter: v => `⭐ ${v}` } },
    grid: { borderColor: '#f3f4f6' },
  };
  new ApexCharts(document.getElementById('chart-highly-rated'), options).render();
}

// ── Avg Rating by Genre → donut ──────────────────────────────────────────────
async function loadAvgByGenre() {
  const data = await fetchJSON(`${BASE}/avg-by-genre`);
  const options = {
    chart: { type: 'donut', height: 280 },
    series: data.map(r => parseFloat(r.average_rating)),
    labels: data.map(r => r.genre),
    colors: BLUE_PALETTE,
    dataLabels: { enabled: true, style: { fontSize: '11px' } },
    legend: { position: 'bottom', fontSize: '12px' },
    tooltip: { y: { formatter: v => `⭐ ${v.toFixed(2)}` } },
    plotOptions: { pie: { donut: { size: '60%' } } },
  };
  new ApexCharts(document.getElementById('chart-avg-genre'), options).render();
}

// ── Trending → area chart ────────────────────────────────────────────────────
async function loadTrending() {
  const data = await fetchJSON(`${BASE}/trending`);
  const options = {
    chart: { type: 'area', height: 260, toolbar: { show: false }, sparkline: { enabled: false } },
    series: [{ name: 'Watch Count', data: data.map(r => r.watch_count) }],
    xaxis: { categories: data.map(r => r.title), labels: { style: { fontSize: '10px' }, rotate: -30 } },
    colors: ['#2563eb'],
    fill: { type: 'gradient', gradient: { shadeIntensity: 1, opacityFrom: 0.4, opacityTo: 0.05 } },
    dataLabels: { enabled: false },
    stroke: { curve: 'smooth', width: 2 },
    tooltip: { y: { formatter: v => `${v} watches` } },
    grid: { borderColor: '#f3f4f6' },
  };
  new ApexCharts(document.getElementById('chart-trending'), options).render();
}

// ── Most Rated by Users → radial bar ─────────────────────────────────────────
async function loadMostRatedUsers() {
  const data = await fetchJSON(`${BASE}/most-rated-users`);
  const max = Math.max(...data.map(r => r.user_count));
  const options = {
    chart: { type: 'radialBar', height: 320 },
    series: data.map(r => Math.round((r.user_count / max) * 100)),
    labels: data.map(r => r.title),
    colors: BLUE_PALETTE,
    plotOptions: {
      radialBar: {
        dataLabels: {
          name: { fontSize: '11px' },
          value: { fontSize: '12px', formatter: (v, { seriesIndex }) => data[seriesIndex].user_count },
        },
      },
    },
    legend: { show: true, position: 'bottom', fontSize: '11px' },
  };
  new ApexCharts(document.getElementById('chart-most-users'), options).render();
}

// ── Init ─────────────────────────────────────────────────────────────────────
loadTopRated();
loadHighlyRated();
loadAvgByGenre();
loadTrending();
loadMostRatedUsers();
