# ─────────────────────────────────────────
#  Multi-Domain Static Site
#  Domains: main.yourdomain.com / dev.yourdomain.com
# ─────────────────────────────────────────
FROM nginx:alpine
 
# Remove default nginx config
RUN rm /etc/nginx/conf.d/default.conf
 
# Copy custom nginx config
COPY nginx/nginx.conf /etc/nginx/conf.d/multi-domain.conf
 
# Copy website files for each domain
COPY main/ /usr/share/nginx/main/
COPY dev/  /usr/share/nginx/dev/
 
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]