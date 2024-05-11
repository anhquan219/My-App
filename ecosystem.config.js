module.export = {
  app: [
    {
      name: "my-app",
      script: "node dist.index",
      env: {
        NODE_ENV: "development",
        TEN_BIEN: "Gia tri",
      },
      env_production: {
        NODE_ENV: "production",
      },
    },
  ],
};
