module.exports = {
  devServer: {
    proxy: {
      "^/api": {
        target: "http://localhost:8000",
        pathRewrite: { "^/api/": "/api/" },
        changeOrigin: true,
        logLevel: "debug"
      },
      "^/auth": {
        target: "http://localhost:8000",
        pathRewrite: { "^/auth/": "/auth/" },
        changeOrigin: true,
        logLevel: "debug"
      }
    }
  }
};