#slim===smaller version
FROM python:3.11-slim 

#WORKDIR---> app isimli bir dizin oluşturur.
WORKDIR /app

#requirements.txt ve ardından bağlımlılıkları yükler
COPY requirements.txt ./
RUN pip install --no-cache-dir --upgrade -r requirements.txt

#app içindeki her dosyayı kopyalar.
COPY . /app/

#server ayağa kalkar.
CMD ["python", "app.py", "--host", "0.0.0.0", "--port", "5000", "--reload"]