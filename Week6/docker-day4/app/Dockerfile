FROM python:3.9

WORKDIR /app

ENV DB_HOST=db
ENV DB_USER=root
ENV DB_PASSWORD=root
ENV DB_NAME=appdb

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

CMD ["python", "app.py"]