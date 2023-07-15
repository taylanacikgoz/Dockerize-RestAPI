# Dockerize an API in Python Environment

\*Github Reposu oluşturdum.

\*Task olarak gelen dosyaları repoya yükleyerek başladım.

\*git bash ile Clone → →ardından VsCode ile açtım.

💡 **Tüm ekran görüntüleri ve açıklamalar Github reposunda Komutlar adlı klasör içerisinde.**

### Tüm Komutlar

1. Uygulamanın çalışabilmesi için gerekli komutların yer aldığı Dockerfile oluşturdum.

   ```docker
   #slim===smaller version
   FROM python:3.11-slim

   #WORKDIR---> app isimli bir dizin oluşturur.
   WORKDIR /app

   #her şeyi app içine kopyalar ve ardından bağlımlılıkları yükler.
   COPY . /app/
   RUN pip install --no-cache-dir --upgrade -r requirements.txt

   #server ayağa kalkar.
   CMD ["python", "app.py", "--host", "0.0.0.0", "--port", "5000", "--reload"]
   ```

2. Ardından Local’de Docker Image oluşturdum.

   ```docker
   docker build -t flaskapi-image .
   ```

3. Oluşan image kontrolleri için;

   ```docker
   docker images
   ```

4. Dockerhub hesabıma giriş yaptım.

   ```docker
   docker login -u <username>
   ```

5. Local’de oluşturulan image’i **<username/imagename:tag>** formatına getirdim

   ```docker
   docker tag flaskapi-image trrilobit/flaskapi-bc4m:v1.0
   ```

6. Docker Hub hesabıma giriş yaparak yetki aldığım için push’ladım.

   ```docker
   docker push trrilobit/flaskapi-bc4m:v1.0
   ```

7. Local’de çalıştırabilmem için; **docker pull <imagename>:tag**

   ```docker
   docker pull trrilobit/flaskapi-bc4m:v1.0
   ```

8. Docker Image run komutu ile ismi flaskapi-container olan bir container oluşturur ve çalışır.

   ```docker
   docker run --name flaskapi-container -p 5000:5000 -d trrilobit/flaskapi-bc4m:v1.0
   ```

9. Şimdi tarayıcınızda "[http://localhost:5000](http://localhost:5000/)" adresine gidip API'yi test edebilirsiniz.
10. Çalışan container’ın durdurulması için;

    ```docker
    docker stop flaskapi-container
    ```

11. Container durdurulduktan sonra tekrar çalıştırmak için;

    ```docker
    docker start flaskapi-container
    ```

12. Bundan sonra çalıştırmak istersek tekrar isim atamaya gerek yok. Aşağıdaki komutla sadece port numarası atayıp çalıştırabiliriz.

    ```docker
    docker run -p 5000:5000 trrilobit/flaskapi-bc4m:v1.0
    ```

### Karşılaşılan Zorluklar;

- Docker desktop indirdim fakat çalıştıramadım. \***\*WSL yüklemesi ve güncellemesi istedi.\*\*** wsl install(Ubuntu) ve name, password oluşturdktan sonra çalıştı. Docker desktop hem local hem de Docker Hub’da image ve container kontrolü veya ekleyip çıkarılması için kolaylık sağlıyor.
- Birkaç sefer localde image oluşturdum. Ardından docker-repoya pushladım fakat pull yaptıktan sonra çalıştırdığımda 5000 portunda çalışmadı. Terminalde run komutu içerisinde port numarasını sürekli belirtmem gerekiyor.
  ```docker
  docker run -p 5000:5000 trrilobit/flaskapi-bc4m:v1.0
  ```
  Dockerfile içerisinde port numarasını zaten verdiğim halde neden terminalde tekrar girmem gerekiyor?
- Aşağıdaki start kodu ile containerı çalıştırdım. Tekrar port belirtmeme gerek kalmadı.
  ```docker
  docker start flaskapi-container
  ```
- Kod içerisinde API’nin döneceği mesajı değiştirdiğim zaman **anlık** değişimleri görmek istedim. Bunun için aşağıda örnekte gösterdiğim gibi volume oluşturup yapan bir kaynak gördüm, denedim fakat çalıştıramadım.
  ```docker
  docker run --name flaskapi-container -p 5000:5000 -d -v $(pwd):/app flaskapi
  ```

💡 **Tüm çözümler için youtube, docker documentation, google kaynaklar kullanılmıştır.**
