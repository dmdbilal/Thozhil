const mongoose = require('mongoose');
require('dotenv').config();

const uri = process.env.MONGODB_URI;

const conn = mongoose.createConnection(uri, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
    serverSelectionTimeoutMS: 30000,
    socketTimeoutMS: 45000
});

conn.on('connected', () => {
    console.log('MongoDB is connected');
});

conn.on('error', (err) => {
  console.error(`Mongoose connection error: ${err}`);
});

module.exports = conn;