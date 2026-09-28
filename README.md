# Email Signature Generator

A single self-contained HTML page (`signature-generator.html`) for building White Spot / Triple O's email signatures. Everything (logos, styles, scripts for rendering a JPEG export) is embedded in the page except two CDN scripts (html2canvas, Microsoft Teams JS SDK), so it can be served as a static file with no backend.

## Work deployment

`azure-pipelines.yaml` copies `signature-generator.html` to `/var/www/signature/signature-generator.html` on the internal `FPT-dev-01` server whenever `main` is updated.

## Running on Synology (Docker)

The repo includes a `Dockerfile` and `docker-compose.yml` that serve the page via nginx.

1. Copy/clone this repo onto the NAS (e.g. via Synology's Git integration, or `git clone` over SSH into a shared folder).
2. In Synology **Container Manager** → **Project**, create a new project pointing at this folder (it will pick up `docker-compose.yml`) and build it. Or from the CLI on the NAS:

   ```sh
   docker compose up -d --build
   ```

3. The page will be available at `http://<nas-ip>:8090`.

To pick up changes after editing `signature-generator.html`, rebuild the project (Container Manager → Project → Build/Action → Rebuild), or run `docker compose up -d --build` again.
