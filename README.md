### ip-rotor
Simple docker image that acts as a socks proxy and rotates tor ips every N seconds. It's set to change every 1 second. Feel free to edit the dockerfile and rebuild to change that.

Inside the project directory, build with:
```
docker build -t ip-rotor .
```

Run:
```
docker run -p 9050:9050 --name myrotor ip-rotor
```

When done with it, stop it with:
```
docker stop myrotor
```

When you want to restart:
```
docker start myrotor
```

Simply use it as a socks proxy. For example:
```
for i in {1..10}; do curl --socks5-hostname localhost:9050 http://icanhazip.com; sleep2; done
```
