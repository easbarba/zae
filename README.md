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

Get all needed dependencies and install `distro` with make:

    $ make deps && make install

PS: you may need to set PATH to find local packages.

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

Its as easy as any command to run `distro` locally:

    $ make build && make run

Test suite may be called with:

    $ make test

After everything is done:

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

` distro` began as a module of a super package called `cejo`, and extracted as
standalone package to follow the UNIX main rule: 'do one thing, well'.

## TODO

- ask to auto generate commands for most common distributions.
- regexp support.
- provide commands w/ additional options by using --options.
- simulate dry-run.
- display information on what executable and final command running.
- use more spec features as mocks, expectation, before...
- non-safe mode.

## License

[Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0)
