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

Get all needed dependencies and install in your system with:

    $ make install

## Commands: add, overwrite, append...

Its rather simple to add new commands, one or multiple per time:

    $ pak --add --pkg 'emerge' --exec '/usr/bin/emerge' --install '-av'

Once a config with exec is present, it is even easier to populate with more commands:

    $ pak --add --pkg 'emerge' --search '-s'

Swap over commands with interesting options, it goes the same way:

    $ pak --add --pkg 'apt' --search 'search --names-only'

Or start it all over again:

    $ pak --purge --pkg 'apt'

## Container

You can find `pak` latest version at docker hub: `easbarbosa/pak:latest`

Want to do it the hard way? can be done with:

    docker build -t $USER/pak .

    docker run --rm $USER/pak exe/pak search git

Or even better with this long one-line command:

    docker run --rm -v $(pwd):/app/ -w /app ruby:3.1.1 bash -c 'mkdir -p ~/.config && cp -r examples ~/.config/pak && bundle && exe/pak search git'


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

## Ruby 3
  Current version of `pak` uses Ruby 3, but, for the moment, should run correctly with early major versions.

## History

`pak` was a module of a super package called `cejo`, and later on extracted
as standalone package to follow the UNIX main rule: 'do one thing, well'.

## TODO

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

[Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0)
