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

app.get("/moreSets/:search", (req, res) => {
    const lastId = req.params.search;
    const searchQuery = req.query.searchQuery;
    db.getMoreSets(lastId, searchQuery)
        .then((data) => {
            console.log("rows when we try to find sets: ", data);
            res.json(data);
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

app.get("/find-sets/:search", (req, res) => {
    db.retrieveMatchingSets(req.params.search)
        .then(({ rows }) => {
            res.json({ rows });
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

// app.get("/moods/:id", (req, res) => {
//     db.getSetsByMood(req.params.id)
//         .then(({ rows }) => {
//             console.log("rows in moods/:id!: ", rows);
//             res.json({ rows });
//         })
//         .catch((err) => {
//             console.log(err);
//             res.json({ success: false });
//         });
// });

app.get("/mood-sets/:id", (req, res) => {
    const { id } = req.params;
    console.log("req.params", req.params);
    db.getSetsByMood(id)
        .then(({ rows }) => {
            console.log("rows in moods-sets/:id!: ", { rows });
            res.json(rows);
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
