#!/bin/bash
# Если ты обращаешься к необъявленной переменной, скрипт аварийно завершится. -u
set -euo pipefail

echo "⚙️ Удаляем старый кластер (если есть ) ...."
minikube delete || true

echo "🚀  Запускаем новый кластер...."
minikube start --driver=docker

echo "💾 Загружаем новый образ nginxdemos/hello"
docker pull nginxdemos/hello
minikube image load nginxdemos/hello 

echo "📦 Создаем деплоймент..."
kubectl create deployment hello-minikube --image=nginxdemos/hello 

echo "⏳  Ждем пока Pod будет готов ....."
kubectl wait --for=condition=ready pod -l app=hello-minikube --timeout=90s

echo "🌐 Экспонируем..."
kubectl expose deployment hello-minikube --type=NodePort --port=80


echo "🔎 Проверяем поды:..."
kubectl get pods

echo "🌏 Запускаем сервер в браузере ....."
minikube service hello-minikube

