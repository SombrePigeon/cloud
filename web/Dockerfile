FROM nginx:alpine as base
EXPOSE 80
COPY nginx.conf /etc/nginx/nginx.conf

#DEV-----------
FROM base as prod
ENV NEXTCLOUD_TRUSTED_DOMAINS "cloud.sombrepigeon.fr cloud.alexismartial.fr"
ENV VIRTUAL_HOST "cloud.sombrepigeon.fr,cloud.alexismartial.fr"
ENV LETSENCRYPT_HOST "cloud.sombrepigeon.fr,cloud.alexismartial.fr"

#PROD----------
FROM base as dev
ENV NEXTCLOUD_TRUSTED_DOMAINS "cloud.sombrepigeon.fr.localhost cloud.alexismartial.fr.localhost"
ENV VIRTUAL_HOST "cloud.sombrepigeon.fr.localhost,cloud.alexismartial.fr.localhost"
