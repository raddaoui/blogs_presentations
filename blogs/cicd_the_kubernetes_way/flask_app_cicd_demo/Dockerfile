FROM python:2.7

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

ADD . .
EXPOSE 5000
ENTRYPOINT ["python"]
CMD ["app.py"]
