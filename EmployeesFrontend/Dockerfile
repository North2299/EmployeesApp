FROM nginx:alpine
LABEL maintainer="mariem.zouari@enis.tn"  
COPY /nginx/default.conf /etc/nginx/conf.d/
RUN rm -rf /usr/share/nginx/html/*
COPY dist/employeemanagerapp /usr/share/nginx/html