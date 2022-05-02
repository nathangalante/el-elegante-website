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

exports.getMoreSets = (lastId, searchQuery) => {
    if (!searchQuery) {
        return db.query(
            `SELECT * FROM podcasts
            WHERE id > $1
            ORDER BY id ASC
            LIMIT 6`,
            [lastId]
        );
    }
    return db.query(
        `SELECT * FROM podcasts
            WHERE id > $1 AND name ILIKE $2
            ORDER BY id ASC
            LIMIT 6`,
        [lastId, "%" + searchQuery + "%"]
    );
};

exports.getMoods = () => {
    return db.query(
        `SELECT * FROM moods
        ORDER BY id`
    );
};

exports.getMoodById = (id) => {
    return db.query(
        `SELECT * FROM moods
        WHERE id = $1
        ORDER BY id`,
        [id]
    );
};

exports.getSetsByMood = (moodId) => {
    return db.query(
        `SELECT * FROM podcasts
        WHERE mood = $1
        ORDER BY id`,
        [moodId]
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
