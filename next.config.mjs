/** @type {import('next').NextConfig} */
const nextConfig = {
    reactStrictMode: true,

  env: {
    GTM_FORMAT_DATE: "Asia/Jakarta",
    DB_HOST: "localhost",
    DB_USER: "postgres",
    DB_PASSWORD: "postgres",
    DB_NAME: "resto",
    DB_PORT: "5432",
    APP_BASEURL: 'http://localhost:3000/',
    BASEURL: 'http://localhost:3000/',
  },
};

export default nextConfig;
