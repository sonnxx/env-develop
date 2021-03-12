proxy_set_header    URI_REQUEST_ORIGIN $request_uri;
proxy_set_header    Host             $http_host;
proxy_set_header    X-Real-IP        $remote_addr;
proxy_set_header    X-Forwarded-For  $proxy_add_x_forwarded_for;
proxy_set_header    X-Forwarded-Proto $scheme;
proxy_set_header    Connection "";
proxy_set_header    Proxy "";

proxy_redirect     off;
client_max_body_size       20M;
#client_body_buffer_size    128k;

proxy_connect_timeout 120;
proxy_send_timeout 120;
proxy_read_timeout 120;
send_timeout 120;

proxy_buffer_size          128k;
proxy_buffers              4 256k;
proxy_busy_buffers_size    256k;
proxy_temp_file_write_size 256k;
proxy_headers_hash_bucket_size 128;

proxy_pass_header Set-Cookie;
proxy_http_version 1.1;

