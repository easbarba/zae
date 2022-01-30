# Distro

Unique commands to manage packages yours favorites GNU/Linux distributions boxes.

<pre>
Ain't ya just annoyed of having to recall all those different commands of every
distribution you happen to need to use? apt that, apk this, dnf those... goddamn!

Look no further! we have here your solution to all your problems: `distro`, the
dream of all tired UNIX power-user comes true.
</pre>

## Usage

    $ distro install ruby
    $ distro remove openjdk
    $ distro installed
    $ distro search "^lib"
    $ distro --help

## Commands 

| command   | -> | information                                         |
|-----------|:--:|-----------------------------------------------------|
| clean     | cl | clean system residual packages dependencies         |
| download  | dl | download package binary                             |
| fix       | fx | fix system issues                                   |
| help      | hp | Shows a list of commands or help for one command    |
| info      | if | View Info About a Specific Package                  |
| install   | in | install package(s) from repositories                |
| installed | id | list all installed packages on system               |
| remove    | rm | remove One or More Installed Packages               |
| search    | sc | find a Package                                      |
| update    | ud | update Package Lists                                |
| upgrade   | ug | upgrade Installed Packages                          |
| getdeps   | gd | get package system dependencies to be built by user |
 
## Configuration

Distro will look for YAML files containing packagers commands at `$XDG_CONFIG_HOME/distro`.

-> `$XDG_CONFIG_HOME/distro/apt.yml`
 
```yaml
---
exec: /usr/bin/apt
builddep: build-dep
clean: autoremove
depends: depends
download: download
fix: install -f
help: help
info: show
install: install
installed: list --installed
remove: remove
search: search
sysupgrade: dist-upgrade
update: update
upgrade: upgrade

```

## Installation

Get all needed dependencies and install `distro` with make:

    $ make deps && make install

-- User install only!

PS: you may need to set PATH to find local packages.


## History
Distro began as a module of a super package called `cejo` and extracted as standalone to follow the UNIX main rule: 'do one thing, well'.

## TODO

 - commands shortcuts (download -> dl).
 - major distros commands set by default, but lets user overwrite with its config. 
 - regexp support.
 - simpler name.
 - auto generate commands for most common distributions.
 - improve configuration files by separating commands by: superuser, user, binary...
 
```yaml
---
exec: /usr/bin/apt

super:
    builddep: build-dep
    clean: autoremove
    depends: depends
    install: install
    download: download

user: 
    fix: install -f
    help: help
    info: show
```
 - allow only pre-defined commands to be run.
 - non-safe mode.
 - wizard to easily add a new system commands, user can add only a few cmds at first.
 - simulate dry-run.
 - display information on what executable and final command running.
 - use more rspec features as mocks, expectation, before... 

## License
[GPL version 3](https://www.gnu.org/licenses/gpl-3.0.en.html)

