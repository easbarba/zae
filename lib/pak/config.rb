require 'pathname'

module Pak
  # Query for configuration files and returns matching ones
  class Config
    # package manager found
    attr_accessor :parsed

    def initialize
      @parsed = discovered || all[executable]
    end

    # config files folder location
    def folder
      cfg = Pathname.new(File.join(Dir.home, '.config', 'pak')) # if cfg.exist?

      xdg_config_folder || cfg
    end

    # package manager executable available
    def executable
      return Pathname.new(discovered[:exec]).basename.to_path.to_sym if discovered?

      # get all availables executables
      exec = all.each_value.find { |cfg| Config.which?(cfg[:exec]) }[:exec]
      Pathname.new(exec).basename.to_path.to_sym
    end

    # active package manager executable
    alias active executable

    # once executable is discovered create a new file w/ its path or name in
    # $HOME to avoid probing everytime run
    def discovered
      exec = folder.join('.discovered').read.chop.to_sym if discovered?

      all[exec] || nil
    end

    # is there any configuration available?
    def any?
      all.any?
      # - config folder do exist?
      # - any yaml config file?
      # - .discovered do exist?
    end

    private

    def self.which?(executable)
      File.executable? executable.to_s
    end

    # Get all Configuration files
    def all
      # return if any?

      {}.tap do |elem|
        folder.each_child do |file|
          name = file.sub_ext('').basename.to_s.to_sym
          elem[name] = load_config(file)
        end
      end
    end

    # once executable is discovered create a new file w/ its path or name in
    # $HOME to avoid probing everytime run
    def discovered?
      folder.join('.discovered').exist?
    end

    #  when xdg config is set, defaults to it to probe for configuration fiels
    def xdg_config_folder
      Pathname.new(File.join(Dir.home, '.config', 'pak')) if ENV['XDG_CONFIG_HOME']
    end

    # Load file with famous serialization formats
    def load_config(file)
      require 'yaml'
      YAML.load_file(file, symbolize_names: true)
    end
  end
end
