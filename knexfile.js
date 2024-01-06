module.exports = {
  development: {
    debug: true,
    client: 'mysql',
    connection: {
      host: 'localhost',
      user: 'root',
      password: '', 
      database: 'db_primeventory' 
    },
    migrations: {
      directory:'./db/migrations',
    },
  },
};

