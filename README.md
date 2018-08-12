# micromdm
micromdm docker image

## Steps to get you local dev running

### Step 1 (create certs)
`mkdir certs`
```
DNSNAME=mdm.example.org;  (cat /etc/ssl/openssl.cnf ; printf "\n[SAN]\nsubjectAltName=DNS:$DNSNAME\n") | openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 -sha256 -keyout certs/server.key -out certs/server.crt -subj "/CN=$DNSNAME" -reqexts SAN -extensions SAN -config /dev/stdin
```

### Step 2