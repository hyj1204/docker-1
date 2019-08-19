external_url "https://192.168.99.111"
letsencrypt['enable'] = false
nginx['redirect_http_to_https'] = true
nginx['ssl_certificate'] = "/etc/gitlab/trusted-certs/gitlab.yijhuang.com.crt"
nginx['ssl_certificate_key'] = "/etc/gitlab/trusted-certs/gitlab.yijhuang.com.key"
gitlab_rails['gitlab_shell_ssh_port'] = 8022
