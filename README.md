# Zae

A handy runner of distributions package managers commands. 

<pre>
Ain't ya just annoyed of having to recall all those different commands of every
distribution you happen to need to use? apt that, apk this, dnf those...

geez!

Look no further! we have here a solution to all your problems: `zae`,
where the dream of all tired UNIX power-user comes true.
</pre>


Available on: [rubygems](https://rubygems.org/gems/zae) |
[hub.docker](https://hub.docker.com/repository/docker/easbarbosa/zae)

## Usage

```sh
zae install git neovim
zae remove openjdk
zae installed
zae search '^erlang'
zae search --options '--names-only' tmux
zae --help
```

## Commands

| command   | -> | information                                      |
|-----------|:--:|--------------------------------------------------|
| clean     | cl | clean system residual packages dependencies      |
| deps      | de | install dependencies packages of package         |
| depends   | dp | list all dependencies of package                 |
| download  | dl | download package binary                          |
| fix       | fx | fix system package manager issues                |
| help      | hp | shows a list of commands or help for one command |
| info      | if | view info about a specific package               |
| install   | in | install package(s) from repositories             |
| installed | id | list all installed packages on system            |
| remove    | rm | remove one or more installed packages            |
| search    | sc | search for matching packages of term             |
| update    | ud | update packages database                         |
| upgrade   | up | upgrade installed packages                       |

## Installation

Get all dependencies and install with:

    $ bin/setup && bin/install

## Configuration

`zae` query for configuration files at `$XDG_CONFIG_HOME/zae`:

`$XDG_CONFIG_HOME/zae/apt.yml`

```yaml
exec: /usr/bin/apt
become:
  clean: autoremove
  deps: build-dep
  download: download
  fix: install -f
  install: install
  remove: remove
  update: update
  upgrade: upgrade
user:
  depends: depends
  info: show
  help: help
  search: search
  version: version
```


## Container

    docker build -t $USER/zae .
    docker run --rm -it $USER/zae sh -c 'exe/zae install git'

## History

`zae` was a module of a super package called `cejo`, and later on extracted
as standalone package to follow the UNIX main rule: 'do one thing, well'.

## TODO

- typed ruby
- implement whats is applicable of the twelve factors.
- let user provide w/ additional options to commands (--options).
- generate configuration template
- check if current config has suspect commands as rm,cd,mv, before running
- log configuration changes
- history of commands
- upload to main repository package
- dry-run.
- non-safe mode.
- error handling

## License

[GNU General Public License, Version 3](https://www.gnu.org/licenses/gpl-3.0.en.html)
