# Channels DVR Mapper (Backend Only) - Windows Docker Setup

This guide helps you run the Channels DVR Mapper (backend only) using Docker on Windows, with PowerShell. It excludes the Channels DVR frontend UI.

## Prerequisites

- **Windows 10/11 with Docker Desktop installed**
- **PowerShell (run as Administrator)**
- **Git installed**

---

## Setup Instructions

### 1. Clone the repositories

```powershell
git clone https://github.com/crackers8199/channels-dvr-mapper-docker.git
cd .\channels-dvr-mapper-docker
git clone https://github.com/crackers8199/channels-dvr-mapper.git
```

> Make sure the `channels-dvr-mapper` folder is inside `channels-dvr-mapper-docker`.

---

### 2. Create required folders

These folders store Channels DVR configuration and recordings.

```powershell
New-Item -ItemType Directory -Force .\channels-backend\config
New-Item -ItemType Directory -Force .\channels-backend\recordings
```

---

### 3. Prepare the Dockerfile

Place the provided `Dockerfile` inside the `channels-dvr-mapper` folder (same level as `index.php`).

---

### 4. Add `.env` file to mapper

Inside the `channels-dvr-mapper` folder, create a file named `.env` with this content:

```dotenv
CHANNELS_SERVER_IP=channels-backend
```

This tells the mapper where to find the Channels DVR backend from within Docker.

---

### 5. Run Docker Compose

From the root of the `channels-dvr-mapper-docker` folder:

```powershell
docker-compose up --build -d
```

This builds the PHP mapper image and starts both the backend DVR and mapper containers.

---

## Access the Services

- **Channels DVR Backend:**  
  [http://localhost:8090](http://localhost:8090)

- **Channels DVR Mapper UI:**  
  [http://localhost:8080](http://localhost:8080)

---

## Configuration Notes

- **Environment Variable**: The mapper uses `CHANNELS_SERVER_IP=channels-backend` from the `.env` file to connect internally to the DVR backend.
- **Volumes**: Docker volumes are mapped to `./channels-backend` and `./channels-dvr-mapper` using relative Windows paths.
- **Line Endings**: If you run into script errors, ensure files use LF (Unix) line endings instead of CRLF (Windows).

---

## Stopping Services

```powershell
docker-compose down
```

---

## Troubleshooting Tips

- ❗ If you get errors about permissions or file not found, ensure:
  - You're using **WSL2 backend** in Docker Desktop settings
  - You're running PowerShell as **Administrator**
- ❗ If `localhost:8090` or `:8080` doesn't respond, wait 15–30 seconds and refresh. Containers may take time to fully start.
- ❗ If the mapper shows a blank page or errors, check that your `.env` file is correct and your container has internet access.

---

Happy mapping! 🗺️📺

