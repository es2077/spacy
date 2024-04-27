/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  swcMinify: true,
  async rewrites() {
    return [
      {
        source: "/api/graphql",
        destination: process.env.NEXT_HASURA_GRAPHQL_API,
      },
    ];
  },
  skipTrailingSlashRedirect: true,
};

module.exports = nextConfig;
