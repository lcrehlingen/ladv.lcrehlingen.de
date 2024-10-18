from fastapi import FastAPI

app = FastAPI(title="LADV", docs_url="/swagger",
              openapi_url="/swagger-json", redoc_url=None)
