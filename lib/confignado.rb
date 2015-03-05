module Confignado
  class << self
    attr_writer :defaults_filename, :environment

    def defaults_filename
      @defaults_filename || 'defaults'
    end

    def environment
      # FIXME: ENV['RAILS_ENV'] is deprecated
      @environment || ENV['RAILS_ENV'] || ENV['RACK_ENV']
    end

    def load(directory)
      defaults = YAML.load(ERB.new(File.new("#{directory}/#{defaults_filename}.yml").read).result)
      puts defaults.to_s
      environment = YAML.load(ERB.new(File.new("#{directory}/#{self.environment}.yml").read).result)
      puts environment.to_s

      # REMOVE: Need to deep merge just-in-time
      final = defaults.merge(environment)
      puts final.to_s
    end
  end
end
