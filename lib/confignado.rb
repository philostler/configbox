module Confignado
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
        deep_merge_hashes composite, layer
      end
      @composite.freeze
    end
    private

    def deep_merge_hashes(hash, other_hash)
      other_hash.each_pair do |key, value|
        this_value = hash[key]

        hash[key] = if this_value.is_a?(Hash) && value.is_a?(Hash)
          this_value.deep_merge(value)
        else
          value
        end
      end

      hash
    end
  end
end
