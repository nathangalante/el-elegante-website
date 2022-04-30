const express = require("express");
const app = express();
const compression = require("compression");
const path = require("path");
const db = require("./db");

app.use(compression());

app.use(express.static(path.join(__dirname, "..", "client", "public")));

app.get("/sets", (req, res) => {
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
            res.json({ rows });
        })
        .catch((err) => {
            console.log(err);
        });
});

app.get("/sets/:lowestId", (req, res) => {
    console.log("Halloooo", req.params);
    db.getMoreSets(req.params.lowestId)
        .then(({ rows }) => {
            console.log("rows", rows);
            res.json(rows);
        })
        .catch((err) => {
            console.log(err);
        });
});

app.get("/moods", (req, res) => {
    db.getMoods()
        .then(({ rows }) => {
            console.log("rows in moods!: ", rows);
            res.json({ rows });
        })
        .catch((err) => {
            console.log(err);
            res.json({ success: false });
        });
});

app.get("*", function (req, res) {
    res.sendFile(path.join(__dirname, "..", "client", "index.html"));
});

app.listen(process.env.PORT || 3001, function () {
    console.log("I'm listening.");
});
