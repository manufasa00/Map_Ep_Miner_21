@echo off
start "server.jar" java -jar server.jar
echo Avvio del client
timeout 3
start "client.jar" java -jar client.jar 127.0.0.1 8080
