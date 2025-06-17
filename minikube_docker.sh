#!/bin/bash

# Гарантирует, что скрипт остановится при первой ошибке, а не продолжит "вслепую"
set -euo pipefail

# Удаляем старый кластер, если он есть
minikube delete && \

# Запускаем minikube с драйверо docker (если установлен)
minikube start --driver=docker && \

# Скачиваем нужный образ
docker pull nginxdemos/hello && \

# Заргужаем его внутрь Minikube
minikube image load nginxdemos/hello && \

# Создаем деплоймент
kubectl create deployment hello-minikube --image=nginxdemos/hello && \

# Убеждаемся, что кластер жив
kubectl get nodes && \

# Экспонировать деплоймент как сервис
kubectl expose deployment hello-minikube --type=NodePort --port=80 && \

# Проверяем, что поды запущенны
kubectl get pods && \

# Ждем, пока под будет  в статусе READY
kubectl wait --for=condition=ready pod -l app=hello-minikube --timeout=90s && \

# Открываем сервис и браузер
minikube service hello-minikube
