const http = require('http');
const PORT = process.env.PORT || 8080;
const server = http.createServer((req, res) => {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello from auto-version-ci-cd\n');
});
server.listen(PORT, () => console.log('Listening on', PORT));
