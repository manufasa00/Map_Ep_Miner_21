@echo off
start "server.jar" java -jar server.jar
echo Avvio del client
timeout 3
start "ClientFx.jar" java -jar ClientFx.jar 127.0.0.1 8080
