// app/javascript/chart_config.js

import Chart from 'chart.js/auto';

document.addEventListener('DOMContentLoaded', () => {
  const canvas = document.getElementById('dispatchChart');
  if (!canvas) return;

  const days = JSON.parse(canvas.getAttribute('data-days'));
  const counts = JSON.parse(canvas.getAttribute('data-counts'));

  new Chart(canvas, {
    type: 'bar',
    data: {
      labels: days,
      datasets: [{
        label: 'Dispatch Counts',
        data: counts,
        backgroundColor: 'rgba(54, 162, 235, 0.2)',
        borderColor: 'rgba(54, 162, 235, 1)',
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
});
