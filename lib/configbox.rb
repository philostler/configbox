require 'active_support/core_ext/hash/deep_merge'
require 'active_support/core_ext/hash/keys.rb'

module ConfigBox
  class << self
    attr_writer :environment, :file_layers

    def environment
      # FIXME: ENV['RAILS_ENV'] is deprecated
      @environment || ENV['RAILS_ENV'] || ENV['RACK_ENV']
    end

    def file_layers
      @file_layers || ['defaults', environment]
    end

    def load(directory)
      configuration_layers = file_layers.map do |file_layer|
        YAML.load(ERB.new(File.new("#{directory}/#{file_layer}.yml").read).result)
      end

      @composite = configuration_layers.reduce do |composite, layer|
        composite.deep_merge layer
      end
      @composite.deep_symbolize_keys!
      @composite.freeze

      process
    end

    def process
      @composite.each_pair do |key, value|
        @adapters[key.to_sym].new(value).process
      end
    end

    def register(adapter)
      @adapters = {} unless @adapters
      @adapters[adapter.key] = adapter
    end
  end
end

require_relative 'configbox/adapters/init'
