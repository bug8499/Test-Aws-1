# ─────────────────────────────────────────
#  Single-page static site (per branch)
#  This image is built on each branch and serves
#  the branch's own index.html. Routing by hostname
#  is handled by the upstream reverse proxy.
# ─────────────────────────────────────────
FROM nginx:1.27-alpine

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx/nginx.conf /etc/nginx/conf.d/site.conf
COPY index.html /usr/share/nginx/html/index.html

ARG ENV_LABEL=Main
ARG ENV_LONG=production
ARG ENV_DOMAIN=main

RUN sed -i \
    -e "s/__ENV_LABEL__/${ENV_LABEL}/g" \
    -e "s/__ENV_LONG__/${ENV_LONG}/g" \
    -e "s/__ENV_DOMAIN__/${ENV_DOMAIN}/g" \
    /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
