const spicedPg = require("spiced-pg");
const db = spicedPg(
    process.env.DATABASE_URL ||
        `postgres:postgres:postgres@localhost:5432/podcasts`
);

exports.getDataForWidget = () => {
    return db.query(
        `SELECT * FROM podcasts
        ORDER BY id
        LIMIT 3`
    );
};

exports.retrieveMatchingSets = (search) => {
    return db.query(
        `SELECT * FROM podcasts
        WHERE name ILIKE $1`,
        ["%" + search + "%"]
    );
};

exports.getMoreSets = (lastId) => {
    return db.query(
        `SELECT * FROM podcasts
        WHERE id > $1
        ORDER BY id ASC
        LIMIT 6`,
        [lastId]
    );
};

exports.getMoods = () => {
    return db.query(
        `SELECT * FROM moods
        ORDER BY id`
    );
};

exports.giveMoodsToPodcasts = (id, userId) => {
    return db.query(
        `SELECT moods.id, moods.mood
        FROM podcasts
        JOIN moods
        ON id = $1 AND user_id = $1`,
        [id, userId]
    );
};
