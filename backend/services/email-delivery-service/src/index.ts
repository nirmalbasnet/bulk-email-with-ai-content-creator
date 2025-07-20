import path from "path";
import fastify from "fastify";
import autoload from "@fastify/autoload";

import "./utils/loadEnv";

const server = fastify();

// Autoload plugins for dev env

if (process.env.NODE_ENV !== "production") {
  server.register(autoload, {
    dir: path.join(__dirname, "plugins/dev"),
    options: {}, // options passed to each plugin
    autoHooks: true, // optional: will auto-load files like onRequest.ts, onSend.ts, etc.
  });
}

// Autoload routes
server.register(autoload, {
  dir: path.join(__dirname, "routes"),
  dirNameRoutePrefix: true,
});

server.listen({ port: 8080, host: "0.0.0.0" }, (err, address) => {
  if (err) {
    console.log("Server exited with error ::", err);
    process.exit(1);
  }

  console.log(`Server started with address :: ${address}`);
});
