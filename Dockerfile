# FrontendSite/Dockerfile

FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
  build-essential            \
  curl                       \
  software-properties-common \
  git

RUN rm -rf /var/lib/ap/lists/*

# RUN git clone https://github.com/lowrisc-nas/FrontendSite
COPY . .

RUN pip3 install -r requirements.txt

EXPOSE 8501

HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

ENTRYPOINT ["streamlit", "run", "frontend_app.py", "--server.port=8501", "--server.address=0.0.0.0"]