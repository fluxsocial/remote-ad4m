# Remote AD4M

Proposal: [AD4M Hosting](https://hackmd.io/@2dHpJQYgQrCqfxqXMtJTFQ/BJMp4nV1j)

## Usage

1. Setup an instance from cloud server like Google Cloud, AWS, Vultr, DigitalOcean.

2. Config you DNS record, A record point to your server's IP address

3. cd nginx-proxy-authomation/proxy/bin && ./fresh-start.sh --yes -e your_email@domain --skip-docker-image-check

4. run ad4m,
```shell
docker run -d -e VIRTUAL_HOST=ad4m.threechain.xyz -e LETSENCRYPT_HOST=ad4m.threechain.xyz --network=proxy --rm --name ad4m kaichaosun/remote-ad4m:v0.0.27
```

## Build AD4M Docker Image

```shell
# Build the image locally
docker build -t kaichaosun/remote-ad4m:v0.0.27 --platform linux/x86_64 .  # `--platform linux/x86_64` need by MacOS Apple Chip

# Publish image
docker push kaichaosun/remote-ad4m:v0.0.27
```