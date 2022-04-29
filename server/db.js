const spicedPg = require("spiced-pg");
const db = spicedPg(
    process.env.DATABASE_URL ||
        `postgres:postgres:postgres@localhost:5432/podcasts`
);

exports.getDataForWidget = () => {
    return db.query(
        `SELECT * FROM podcasts
        ORDER BY id`
    );
};

exports.retrieveMatchingSets = (search) => {
    return db.query(
        `
      SELECT * FROM podcasts
        WHERE name ILIKE $1
  `,
        [search + "%"]
    );
};