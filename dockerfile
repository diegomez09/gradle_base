FROM gradle:latest
COPY . /home/usr/src
WORKDIR /home/usr/src
RUN chmod +x ./gradlew && \
    ./gradlew clean test --no-daemon && \
    ./gradlew build
EXPOSE 8081