from dotenv import load_dotenv
import os

load_dotenv('.env')

def get_config():
    return {
        "PORT": int(os.getenv("PORT", 8000)),
        "HOST": os.getenv("HOST", "http:///localhost"),
}