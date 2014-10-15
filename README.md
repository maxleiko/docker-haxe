## Haxe Docker Image

### Retrieve image
```sh
docker pull maxleiko/haxe
```

### Usage
```sh
docker run -v /path/to/your/haxe/project:/root/workspace:rw -it maxleiko/haxe
```  

By default, `maxleiko/haxe` will try to run `haxe build.hxml` into `/root/workspace`