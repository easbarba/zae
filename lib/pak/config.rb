# frozen_string_literal: true

require 'pathname'

module Pak
  # Query for configuration files and returns matching ones
  class Config
    CFG_FOLDER = Pathname.new(File.join(Dir.home, '.config', 'pak'))

    # package manager found
    attr_accessor :found

    def initialize
      @found = discovered || files[executable]
    end

    # config files folder location
    def folder
      xdg_config_folder || CFG_FOLDER
    end

    # package manager executable location
    def executable
      return Pathname.new(discovered[:exec]).basename.to_path.to_sym if discovered?

      # get all availables executables
      exec = files.each_value.find { |cfg| Config.executable? cfg[:exec] }[:exec]
      Pathname.new(exec).basename.to_path.to_sym
    end

    # active package manager executable
    alias active executable

    # once executable is discovered create a new file w/ its path or name in
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

    private

    # executable exist?
    def self.executable?(exec)
      File.executable? exec.to_s
    end

    # Get all Configuration files
    def files
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
