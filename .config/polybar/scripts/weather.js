const axios = require('axios');

const apiKey = '2238919945012e08f6e8bb6c7d6c66fa';
const city = 'boulder';

// https://openweathermap.org/weather-conditions
const icons = {
  'Clear': '☀',
  'Clouds': '☁',
  'Rain': '🌧',
  'Drizzle': '🌧',
  'Thunderstorm': '🌩',
  'Snow': '🌨'
};

const run = async () => {
  const url = `http://api.openweathermap.org/data/2.5/forecast?q=${city}&APPID=${apiKey}&units=imperial`;
  console.log('loading');
  const response = await axios.get(url, { timeout: 4000 });
  console.log('done');
  const weather = response.data.list[0].weather[0].main;
  const icon = icons[weather];
  const temp = response.data.list[0].main.temp;
  const tempS = `${temp} °F`;
  if (icon) {
    return `${icon} ${tempS} `;
  } else {
    return `${tempS} `;
  }
}

run()
  .then(message => console.log(message))
  .catch(error => console.log('!'));