from fastapi import FastAPI

from app.routes.root import router as root_router
from app.routes.campaign import router as campaign_router

app = FastAPI()

app.include_router(root_router, prefix="/api/v1", tags=["root"])
app.include_router(campaign_router, prefix="/api/v1", tags=["campaign"])