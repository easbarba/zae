# frozen_string_literal: true

require 'pathname'

module Zae
  # Query for configuration files and returns matching ones
  class Config
    # default configuration location
    DEFAULT_CONFIG_FOLDER = Pathname.new(File.join(Dir.home, '.config', 'zae'))

    # the package manager found
    attr_accessor :found

    def initialize
      @found = discovered || files[executable]
    end

    # configuration folder location
    def folder
      xdg_config_folder || DEFAULT_CONFIG_FOLDER
    end

    # package manager's executable location
    def executable
      return Pathname.new(discovered[:exec]).basename.to_path.to_sym if discovered?

      # get all availables executables
      exec = files.each_value.find { |cfg| Config.executable?(cfg[:exec]) }[:exec]
      Pathname.new(exec).basename.to_path.to_sym
    end

    # Once an executable is discovered create a new file w/ its path or name in
    # $HOME so to avoid probing for it in every startup
    def discovered
      exec = folder.join('.discovered').read.chop.to_sym if discovered?
      files[exec] || nil
    end

    # is there any configuration available?
    def any?
      files.any?
      # - config folder do exist?
      # - any yaml config file?
      # - .discovered do exist?
    end

    # do executable exist?
    def self.executable?(exec)
      File.executable? exec.to_s
    end

    private

    # List one, or if more, all configuration files
    def files
      {}.tap do |elem|
        folder.each_child do |file|
          name = file.sub_ext('').basename.to_s.to_sym
          elem[name] = load_config(file)
        end
      end
    end

    # Once an executable is discovered, it better creates a file
    # indicating current system package manager executable
    # to avoid probing for it everytime run
    def discovered?
      folder.join('.discovered').exist?
    end

    #  When xdg config is set, defaults to it configuration location
    def xdg_config_folder
      Pathname.new(File.join(ENV['XDG_CONFIG_HOME'], 'zae')) if ENV['XDG_CONFIG_HOME']
    end

    # Load serialized file to ruby object
    def load_config(file)
      require 'yaml'
      YAML.load_file(file, symbolize_names: true)
    end
  end
end
