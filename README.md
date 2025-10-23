# Deploying Channels DVR on Render

1. **Push the code to GitHub:** Ensure this repository (with `Dockerfile`, `start.sh`, `render.yaml`, etc.) is pushed to a public GitHub repo. The blueprint file must be named `render.yaml` at the root of the repo:contentReference[oaicite:14]{index=14}.

2. **Import the Blueprint in Render:**  
   - Go to the Render Dashboard and click **New &gt; Blueprint**:contentReference[oaicite:15]{index=15}.  
   - Connect your GitHub account if needed, then select this repository and branch. Give your Blueprint a name (e.g. `channels-dvr`):contentReference[oaicite:16]{index=16}.  
   - Review the resource changes. The blueprint will create a web service `channels-dvr` on the free plan. Click **Apply** to provision.

3. **Automatic Deploy:** Every push to the branch (including changes to `render.yaml` or any code) will automatically deploy the service on Render:contentReference[oaicite:17]{index=17}.

4. **Service Port:** The `channels-dvr` service will be available on port 8089, as set by the blueprint’s `PORT=8089` and `CHANNELS_DVR_PORT=8089`. This matches Channels DVR’s default web port:contentReference[oaicite:18]{index=18}.

You should now have Channels DVR running on Render. Access the DVR web interface via the Render-provided URL (it will forward to port 8089 inside the container). The environment variable settings ensure the DVR listens on the correct port with minimal additional configuration.
