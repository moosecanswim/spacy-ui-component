map $http_upgrade $connection_upgrade {
    default upgrade;
    '' close;
}

server {
    listen 80;
    listen 443 ssl;
    server_name localhost;
    ssl on;
    error_log   /dev/stdout debug;

    #
    # Proxy spacey service requests
    #
    location ^~ /analyses/pos {
      rewrite ^/analyses/pos/(.*) /$1 break;
      proxy_pass        https://${SPACY_SERVICE_HOST}:${SPACY_SERVICE_PORT};
      proxy_set_header USER_DN    $ssl_client_s_dn;
        proxy_set_header Host       $host;
        proxy_set_header X-Real-IP  $remote_addr;
    }


    #
    # Proxy ETL Service requests to MEME site
    #
    # location ^~ /services/wisard-etl/1.2/ {
    #    proxy_pass                  ${ETL_SERVICE_URL}/;
    #    proxy_set_header USER_DN    $ssl_client_s_dn;
    #    proxy_set_header Host       $host;
    #    proxy_set_header X-Real-IP  $remote_addr;
    #}

   
    ssl_certificate /tmp/docker/pki/server.public;
    ssl_certificate_key /tmp/docker/pki/server.private;
    ssl_client_certificate /tmp/docker/pki/trusted.crt;
    ssl_trusted_certificate /tmp/docker/pki/trusted.crt;
    ssl_verify_depth 10;
    ssl_verify_client on;
    ssl_prefer_server_ciphers on;
    ssl_protocols       TLSv1 TLSv1.1 TLSv1.2;
    ssl_ciphers         HIGH:!aNULL:!MD5;

    # set client body size to 50M
    client_max_body_size 50M;
	underscores_in_headers on;

    # other headers for service
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header Host $http_host;
    proxy_pass_request_headers on;

    # SSL configs for connection to client, based on NGINX certificates
    # note: this sets SSL_CLIENT_S_DN header automatically
    proxy_ssl_name twl-server-generic2;
    proxy_ssl_certificate         /tmp/docker/pki/server.public;
    proxy_ssl_certificate_key     /tmp/docker/pki/client.crt;
    proxy_ssl_trusted_certificate /tmp/docker/pki/trusted.crt;
    proxy_ssl_verify_depth  10;
    proxy_ssl_verify        off;
    proxy_ssl_session_reuse on;
    proxy_ssl_protocols           TLSv1 TLSv1.1 TLSv1.2;
    proxy_ssl_ciphers 'ECDHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA256:EC
DHE-RSA-AES256-SHA:ECDHE-RSA-AES128-SHA:DHE-RSA-AES256-SHA256:DHE-RSA-AES128-SHA256:DHE-RSA-AES256-SHA:DHE-RSA-AES128-SHA:ECDHE-RSA-DES-CBC3-SHA:EDH-RSA-DES-CBC3-SHA:AES256-GCM-SHA384:A
ES128-GCM-SHA256:AES256-SHA256:AES128-SHA256:AES256-SHA:AES128-SHA:DES-CBC3-SHA:HIGH:!aNULL:!eNULL:!EXPORT:!CAMELLIA:!DES:!MD5:!PSK:!RC4';
	set $ssl_client_s_dn_value $ssl_client_s_dn;
}
