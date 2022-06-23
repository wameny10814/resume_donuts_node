const http = require("http");//引入http

const server = http.createServer((req, res) => {
    res.writeHead(200, {
        "Content-Type": "text/html",
    });
    res.end(`<h2>He11111llo</h2>
    <p>${req.url}</p>`);
});

server.listen(3000);
