FROM daocloud.io/daocloud/dce-controller:2.6.1

# COPY images/* /usr/share/nginx/html/ui/assets/images/

COPY oem.yml /etc/dce/oem.yml
