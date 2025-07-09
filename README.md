# ci-cd-pipeline

This repo demonstrates a complete CI/CD workflow for a backend app built in NodeJS, using Jenkins to automate build, test, and Docker-based deployment to AWS EC2.

## Steps:

1. Install Docker (if not already)
2. Run Jenkins in a Container

```bash
docker run -d \
  -p 8080:8080 -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  --name jenkins \
  jenkins/jenkins:lts
```

- Access Jenkins: **http://localhost:8080**
- On first launch, it will ask for an unlock key.

3.  Get Unlock Key

```bash
docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

Copy and paste it in the browser to unlock Jenkins.

### command explanation

1. **docker run**
   This tells Docker to start a new container.
2. **-d**
   This stands for detached mode — it runs the container in the background.
   Like running a server in the background so your terminal isn’t blocked.
3. **-p 8080:8080**
   This tells Docker:
   “**Map port 8080 on your host to port 8080 inside the container**.”
   - Jenkins runs its web interface on port 8080 by default.
   - So now you can access Jenkins at **http://localhost:8080**
4. **-p 50000:50000**
   This is for Jenkins agent communication (i.e. remote build agents).

- Port 50000 is used by Jenkins to communicate with agents via JNLP.
- Even if you don’t need it now, it’s a good practice to expose it.

5.  **-v jenkins_home:/var/jenkins_home**
    This mounts a Docker volume to persist Jenkins data.

- jenkins_home -> Name of the volume on your host (auto-created)
- /var/jenkins_home -> Directory inside the container where Jenkins stores all data (configs, jobs, plugins, etc.)

This ensures your Jenkins data persists even if the container is stopped or deleted.

6.**--name jenkins**
Gives your container a custom name: jenkins

So you can refer to it easily:

```bash
docker exec -it jenkins bash
```

7. **jenkins/jenkins:lts**
   This is the Docker image name and tag.

**Start Jenkins in the background, expose ports 8080 and 50000, save Jenkins data to a persistent volume, and name the container jenkins**

---
