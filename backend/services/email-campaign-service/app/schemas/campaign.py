from pydantic import BaseModel

class CampaignCreate(BaseModel):
    name: str
    subject: str
    template: str
