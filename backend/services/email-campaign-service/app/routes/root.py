from fastapi import APIRouter

router = APIRouter()

@router.get("/ping")
def ping():
    return "Welcome to the Email Campaign Service!"