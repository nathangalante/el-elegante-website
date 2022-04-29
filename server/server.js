const express = require("express");
const app = express();
const compression = require("compression");
const path = require("path");
const db = require("./db");

app.use(compression());

app.use(express.static(path.join(__dirname, "..", "client", "public")));

app.get("/image", (req, res) => {
    db.getDataForWidget()
        .then(({ rows }) => {
            res.json({ rows });
        })
        .catch((err) => {
            console.log(err);
            res.json({ success: false });
        });
});

app.get("/find-sets/:search", (req, res) => {
    db.retrieveMatchingSets(req.params.search)
        .then(({ rows }) => {
            console.log("users rows: ", rows);
            res.json({ rows });
        })
        .catch((err) => {
            console.log(err);
        });
});

app.get("*", function (req, res) {
    res.sendFile(path.join(__dirname, "..", "client", "index.html"));
});

app.listen(process.env.PORT || 3001, function () {
    console.log("I'm listening.");
});
