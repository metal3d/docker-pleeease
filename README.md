# Docker-pleeease

[![](https://badge.imagelayers.io/metal3d/pleeease:latest.svg)](https://imagelayers.io/?images=metal3d/pleeease:latest 'Get your own badge on imagelayers.io')

[pleeease](http://pleeease.io/) CSS, SAAS, LESS compiler in a docker image.

# Usage

It will parse css files in the current directory to build a file named "app.min.css".

As the default command line is "pleeease", you can give options and arguments (compile, watch...):

```
docker run --rm -it -u $(id -u):$(id -g) -v $(pwd):/workspace metal3d/pleeease \
    compile src/*.css -t my.file.css
```

You may "watch" file changes to compile "on the fly":

```
docker run --rm -it -u $(id -u):$(id -g) -v $(pwd):/workspace metal3d/pleeease \
    watch css/src -t css/app.min.css
```

Keep in mind to set "-u" option to write files as you current user, and not as "root" user.

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
  cmd: watch css/src -t css/app.min.css
  user: 1000:1000
```

**Important**: the "user" directive set "1000:1000" that should be your own UID and GID (use "`id`" command in a shell to get them). 
Without that, you will write app.min.css as root.



