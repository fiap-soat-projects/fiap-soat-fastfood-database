const databasename = process.env.MONGO_DB_NAME;
db = db.getSiblingDB(databasename);