FROM daocloud.io/daocloud/dce-controller:1.4.0

COPY ui/* /usr/share/nginx/html/ui/

COPY oem.yml /etc/dce/oem.yml