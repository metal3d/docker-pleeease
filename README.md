# Docker-pleeease

[pleeease](http://pleeease.io/) CSS, SAAS, LESS compiler in a docker image.

# Usage

The basic usage is:

```
docker run --rm -it -v $(pwd):/workspace metal3d/pleeease
```

I will parse css files in the current directory to build a file named "app.min.css".

As the default command line is "pleeease-cli", you can give options and arguments:

```
docker run --rm -it -v $(pwd):/workspace metal3d/pleeease src/*.css -t my.file.css
```

The image provides "pleeease-watch", so you can do

```
docker run --rm -it -v $(pwd):/workspace metal3d/pleeease pleeease-wath css/src -t css/app.min.css
```

If you set pleeaserc file and that this file resides in the current directory (that is mounted as volume), you can provide some options. Create a .pleeeaserc file containing: 

```json
{
    "less" : true
}
```
And now, pleeease can process "less" syntax.

Please see: [pleeease documentation](http://pleeease.io/docs/)

# docker-compose

You can use this image inside your docker-compose installation to build css as you're developping. Exemple:

```yml
pleeease:
  image: metal3d/pleeease
  volumes:
  - ./:/workspace
  cmd: pleeease-watch css/src -t css/app.min.css
  user: 1000:1000
```

**Important**: the "user" directive set "1000:1000" that should be your own UID and GID (use "`id`" command in a shell to get them). 
Without that, you will write app.min.css as root.



