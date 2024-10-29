import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  /* config options here */
};

// next.config.js
module.exports = {
  images: {
    domains: ['s3-inventorymanagement.s3.us-east-2.amazonaws.com'], // Specific to your S3 bucket
  },
};


export default nextConfig;
