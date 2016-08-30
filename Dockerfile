FROM daocloud.io/daocloud/dce-controller:1.4.0

COPY images/* /usr/share/nginx/html/ui/

COPY oem.yml /etc/dce/oem.yml