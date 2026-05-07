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

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
