"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const fastify_1 = __importDefault(require("fastify"));
const routes_1 = __importDefault(require("./routes"));
const server = (0, fastify_1.default)();
server.register(routes_1.default);
server.listen({ port: 8080 }, (err, address) => {
    if (err) {
        console.log('Server exited with error ::', err);
        process.exit(1);
    }
    console.log(`Server started with address :: ${address}`);
});
