# 🚀 Minikube Emoji Starter

Скрипт для быстрого и наглядного запуска Kubernetes-кластера через `minikube` с использованием драйвера Docker и образа `nginxdemos/hello`. Включает украшения с эмодзи для более удобной CLI-навигации и диагностики.

---

## 📦 Что делает этот скрипт

- 🔥 Удаляет старый кластер `minikube`, если он существует.
- 🚀 Запускает новый кластер на базе Docker (`--driver=docker`).
- 🐳 Подтягивает Docker-образ `nginxdemos/hello`.
- 📦 Создает Kubernetes-деплоймент.
- 🌐 Экспонирует сервис через `NodePort`.
- 🕓 Ожидает готовности Pod'а и открывает сервис в браузере.

---

## 🧩 Зависимости

Убедитесь, что у вас установлены:

- [`minikube`](https://minikube.sigs.k8s.io/docs/start/)
- [`kubectl`](https://kubernetes.io/docs/tasks/tools/)
- [`docker`](https://docs.docker.com/)
- macOS (или Linux) с поддержкой `docker driver` для minikube

---

## 🛠️ Запуск

```bash
chmod +x minikube_emoji.sh
./minikube_emoji.sh
```
