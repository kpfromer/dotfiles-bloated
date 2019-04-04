const os = require('os');

const networkInterfaces = os.networkInterfaces();
const run = () => {
  if (!networkInterfaces['wg0']) {
    return 'Not Connected';
  }
  return 'Connected';
}

console.log(run());