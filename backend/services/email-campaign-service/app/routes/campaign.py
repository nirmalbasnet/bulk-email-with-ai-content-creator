from fastapi import APIRouter

from app.schemas.campaign import CampaignCreate 

router = APIRouter()

@router.post("/campaigns")
def create_campaign(campaign: CampaignCreate):
    return {"message": "Campaign created successfully", "campaign": campaign}