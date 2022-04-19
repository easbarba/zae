module Pak
  # Load configuration files
  class Config
    def self.which?(executable)
      ENV['PATH'].split(File::PATH_SEPARATOR).any? do |directory|
        File.executable?(File.join(directory, executable.to_s))
      end
    end

    attr_accessor :projects
    attr_reader :keys

    def initialize
      @keys = keys
      @projects = {}
      @projects = configs_found
    end

    # package manager executable which is present
    def executable
      keys.find { |exec| which? exec }.to_sym
    end

    alias active executable

    # configuration folder location
    def folder; end

    private

    def xdg_config_folder; end

    # Load file with famous serialization formats
    def load_config(file)
      require 'yaml'
      YAML.load_file(file, symbolize_names: true)
    end

    # Get all Configuration files
    def all
      config_folder.each_child do |file|
        name = file.basename.sub_ext('').to_s.to_sym
        @projects[name] = load_config(file, ext)
      end
    end
  end
end
