import os
import uvicorn

from app.load_env import get_config

config = get_config()

host = config['HOST']
port = config['PORT']



if __name__ == "__main__":
    print(f"Starting server at {host}:{port}")
    uvicorn.run("app.main:app", host=host, port=port, reload=True)