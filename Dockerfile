#slim===smaller version
FROM python:3.11-slim 

#WORKDIR---> app isimli bir dizin oluşturur.
WORKDIR /app

#her şeyi app içine kopyalar ve ardından bağlımlılıkları yükler.
COPY . /app/
RUN pip install --no-cache-dir --upgrade -r requirements.txt

#server ayağa kalkar.
CMD ["python", "app.py", "--host", "0.0.0.0", "--port", "5000", "--reload"]