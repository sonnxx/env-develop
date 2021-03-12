proxy_set_header URI_REQUEST_ORIGIN $request_uri;
proxy_redirect     off;

proxy_set_header   X-Real-IP        $remote_addr;
proxy_set_header   X-Forwarded-For  $proxy_add_x_forwarded_for;
proxy_set_header   X-Forwarded-Proto $scheme;

client_max_body_size       20M;
#client_body_buffer_size    128k;

#proxy_connect_timeout      90;
#proxy_send_timeout         90;

proxy_read_timeout         60;

proxy_buffer_size          4k;
proxy_buffers              4 32k;
proxy_busy_buffers_size    64k;
proxy_temp_file_write_size 64k;

proxy_pass_header Set-Cookie;
proxy_http_version 1.1;
proxy_set_header Connection "";
proxy_set_header Proxy "";
