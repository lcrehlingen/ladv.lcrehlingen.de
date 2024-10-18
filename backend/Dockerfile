FROM node:20-bookworm-slim

WORKDIR /code

COPY . /code

RUN apt-get update && apt-get install python3 python3-pip -y
RUN python3 -m pip install --no-cache-dir --upgrade -r /code/requirements.txt --break-system-package

COPY ./app /code/app
RUN python3 -m pip install --break-system-package -U prisma 
RUN prisma generate

CMD ["fastapi", "run", "app/main.py", "--proxy-headers", "--port", "80"]
