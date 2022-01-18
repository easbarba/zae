# Distro

Unified commands to manage system packages of distributions boxes.

<pre>
Ain't ya just annoyed of having to recall all those different commands of every
distribution you happen to need to use? apt that, apk this, dnf those...
goddamn!

Look no further! we have here your solution to all your problems: `distro`,
where the dream of all tired UNIX power-user comes true.
</pre>

## Usage

```sh
distro install firefox emacs
distro remove openjdk
distro installed
distro search '^node'
distro search --options '--names-only' rust
distro --help
```

## Commands

| command   | ->  | information                                         |
| --------- | :-: | --------------------------------------------------- |
| clean     | cl  | clean system residual packages dependencies         |
| deps      | de  | get package system dependencies to be built by user |
| depends   | dp  | get package system dependencies to be built by user |
| download  | dl  | download package binary                             |
| fix       | fx  | fix system issues                                   |
| help      | hp  | Shows a list of commands or help for one command    |
| info      | if  | View Info About a Specific Package                  |
| install   | in  | install package(s) from repositories                |
| installed | id  | list all installed packages on system               |
| remove    | rm  | remove One or More Installed Packages               |
| search    | sc  | find a Package                                      |
| update    | ud  | update Package Lists                                |
| upgrade   | up  | upgrade Installed Packages                          |

## Installation

Get all needed dependencies and install in the system:

    $ npm install & npm link

PS: you may need to set $PATH to find local packages.

## Commands: add, overwrite, append...

In a fresh install or container, its easy to add new commands, one or multiple per time:

`$ distro --add --pkg 'emerge' --exec '/usr/bin/emerge' --install '-av'`

Once a config with exec is added it even easier to add new commands:

`$ distro --add --pkg 'emerge' --search '-s'`

Overwrite one command with important options goes the same:

`$ distro --add --pkg 'apt' --search 'search --names-only'`

Or even purge it all and start with your own commands:

`$ distro --purge --pkg 'apt'`

## Container

Lets build as always: 

    $ make build

Make sure everything is smooth and sounding:

    $ make test

Either run or inspect the container with:

    $ make run

    $ make attach

Once you are done, just clean up with:

    $ make purge

## Configuration

`distro` will look for configuration files containing packagers commands at
`$XDG_CONFIG_HOME/distrojs`.

-> `$XDG_CONFIG_HOME/distrojs/apt.yml`

```yaml
exec: /usr/bin/apt
super:
  update: update
  upgrade: upgrade
  deps: build-dep
  clean: autoremove
  depends: depends
  install: install
  remove: remove
  download: download
  fix: install -f
user:
  search: search
  help: help
  info: show
  version: version
```

## History

` distro` was a module of a super package called `cejo`, and later on extracted
as standalone package to follow the UNIX main rule: 'do one thing, well'.

## TODO

- let user provide w/ additional options to commands (--options).
- display information on the command being executable.
- check if current configuration has been altered, cli interface is the recommended way.
- check if current config has weird commands as rm,cd,mv, before running
- log configuration changes
- history of commands
- upload to main repository package
- read-only by default after cli modifications?
- simulate dry-run.
- regexp.
- non-safe mode.

## License

[Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0)
