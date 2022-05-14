# Pak

A handy runner of distributions package managers commands. 

<pre>
Ain't ya just annoyed of having to recall all those different commands of every
distribution you happen to need to use? apt that, apk this, dnf those...

geez!

Look no further! we have here a solution to all your problems: `pak`,
where the dream of all tired UNIX power-user comes true.
</pre>

## Usage

```sh
pak install git neovim
pak remove openjdk
pak installed
pak search '^erlang'
pak search --options '--names-only' tmux
pak --help
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

`pak` query for configuration files at `$XDG_CONFIG_HOME/pak`:

`$XDG_CONFIG_HOME/pak/apt.yml`

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

    docker build -t $USER/pak .
    docker run --rm -it $USER/pak sh -c 'exe/pak install git'

## History

`pak` was a module of a super package called `cejo`, and later on extracted
as standalone package to follow the UNIX main rule: 'do one thing, well'.

## TODO

- implement whats is applicable of the twelve factors.
- prevent naughty words to run as commands such as rm,mv...
- let user provide w/ additional options to commands (--options).
- generate configuration template w/ name and executable location only.
- support flatpak, guix and nix
- --packager <PACKAGER> if more than one packager is available, but defaults to distro tradional ones. 
- display information on the command being executable.
- check if current configuration has been altered, cli interface is the recommended way.
- check if current config has weird commands as rm,cd,mv, before running
- log configuration changes
- history of commands
- upload to main repository package
- read-only by default after cli modifications?
- simulate dry-run.
- regexp.
- check if config file exist, broken symlink or is empty
- only parse found executable commands
- non-safe mode.
- each config as a class ending up as an array of configuration files
- major rewrite based on ansible features
- error handling

## License

[GNU General Public License, Version 3](https://www.gnu.org/licenses/gpl-3.0.en.html)
