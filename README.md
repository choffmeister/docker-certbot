# docker-certbot

Uses [certbot][certbot] to obtain a X.509 certificates from [Let's encrypt][letsencrypt]. Refreshes certificates every 24 hours (if necessary).

## Usage

```bash
docker run -d \
  -v $(pwd)/letsencrypt:/etc/letsencrypt \
  choffmeister/certbot:latest \
  contact@domain.com \
  domain.com,www.domain.com \
  sub.domain.com
```

[letsencrypt]: https://letsencrypt.org/
[certbot]: https://github.com/certbot/certbot
