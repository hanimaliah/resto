import knex from 'knex';
// import {decrypt} from '../lib/decrypt'


let dynamicKnex = knex({
    client: 'pg',
    connection: {
      host : process.env.DB_HOST ,
      port : process.env.DB_PORT,
      user : process.env.DB_USER,
      password : process.env.DB_PASSWORD,
      database : process.env.DB_NAME
    },
    searchPath: ['knex', 'public'],
  });

export const setDatabaseConfig = (config) => {
  dynamicKnex = knex(config);
  
}

export default dynamicKnex