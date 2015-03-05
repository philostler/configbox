module Confignado
  attr_writer :environment

  def self.environment
    @environment || Rail.env || ENV['RACK_ENV']
  end

  def self.load(directory)
    defaults = YAML.load(ERB.new(File.new("#{directory}/default.yml").read).result)
    environment = YAML.load(ERB.new(File.new("#{directory}/#{self.environment}.yml").read).result)

    final = defaults.merge(environment)
  end
end
