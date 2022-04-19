require 'pathname'

module Pak
  # Load configuration files
  class Config
    def self.which?(executable)
      ENV['PATH'].split(File::PATH_SEPARATOR).any? do |directory|
        File.executable?(File.join(directory, executable.to_s))
      end
    end

    # all projects found
    attr_accessor :projects

    # all availables configuration executable names
    attr_reader :keys

    def initialize
      @projects = all
      @keys = @projects.keys
    end

    # configuration default folder location
    def folder
      x = Pathname.new(File.join(Dir.home, '.config', 'pak'))
      x if x.exist?
    end

    # package manager executable which is present
    def executable
      keys.find { |exec| Config.which? exec }.to_sym
    end

    def found
      @projects[executable]
    end

    alias active executable

    private

    #  check if xdg config is set and defaults to it to find configuration fiels
    def xdg_config_folder; end

    # Load file with famous serialization formats
    def load_config(file)
      require 'yaml'
      YAML.load_file(file, symbolize_names: true)
    end

    # Get all Configuration files
    def all
      p = {}

      folder.each_child do |file|
        name = file.sub_ext('').basename.to_s.to_sym
        p[name] = load_config(file)
      end

      p
    end
  end
end
