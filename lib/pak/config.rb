require 'pathname'

module Pak
  # Load configuration files
  class Config
    def self.which?(executable)
      File.executable? executable.to_s
    end

    # all packagers found
    attr_accessor :packager

    def initialize
      @packager = discovered || all[executable]
    end

    # configuration default folder location
    def folder
      cfg = Pathname.new(File.join(Dir.home, '.config', 'pak'))
      # if cfg.exist?
      xdg_config_folder || cfg
    end

    #  when xdg config is set, defaults to it to probe for configuration fiels
    def xdg_config_folder
      Pathname.new(File.join(Dir.home, '.config', 'pak')) if ENV['XDG_CONFIG_HOME']
    end

    # package manager executable which is present
    def executable
      return Pathname.new(discovered[:exec]).basename.to_path.to_sym if discovered?

      # get all availables executables
      exec = all.each_value.find { |cfg| Config.which?(cfg[:exec]) }[:exec]
      Pathname.new(exec).basename.to_path.to_sym
    end

    # packager configuration found
    def found
      @packager
    end

    alias active executable

    # once executable is discovered create a new file w/ its path or name in
    # $HOME to avoid probing everytime run
    def discovered?
      folder.join('.discovered').exist?
    end

    # once executable is discovered create a new file w/ its path or name in
    # $HOME to avoid probing everytime run
    def discovered
      exec = folder.join('.discovered').read.chop.to_sym if discovered?

      all[exec] || nil
    end

    # Get all Configuration files
    def all
      packagers = {}

      folder.each_child do |file|
        name = file.sub_ext('').basename.to_s.to_sym
        packagers[name] = load_config(file)
      end

      packagers
    end

    private

    # Load file with famous serialization formats
    def load_config(file)
      require 'yaml'
      YAML.load_file(file, symbolize_names: true)
    end
  end
end
