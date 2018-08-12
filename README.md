# micromdm
micromdm docker image

## Steps to get you local dev running

### Step 1 (create certs)
`mkdir certs`
```
DNSNAME=mdm.example.org;  (cat /etc/ssl/openssl.cnf ; printf "\n[SAN]\nsubjectAltName=DNS:$DNSNAME\n") | openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 -sha256 -keyout certs/server.key -out certs/server.crt -subj "/CN=$DNSNAME" -reqexts SAN -extensions SAN -config /dev/stdin
```

### Step 2

Setup mdmctl on you local dev station

Configure server settings
```
./mdmctl config set -api-token secret -name mdmexample -server-url https://mdm.example.org:6443 -skip-verify
```
Select config
```
./mdmctl config switch -name mdmexample
```
Check that it works
```
./mdmctl get devices
```

Upload push cert (example)
```
./mdmctl mdmcert upload -password secret -cert /tmp/MDM_\ McMurtrie\ Consulting\ LLC_Certificate.pem  -private-key /tmp/mdmcert.download.push.key
```
