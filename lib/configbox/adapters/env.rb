module ConfigBox
  module Adapters
    class Env < ConfigBox::Adapters::Base
      def self.key
        :env
      end

      def process
        @configuration.each_pair do |key, value|
          ENV[key] = value
        end
      end
    end
  end
end

ConfigBox.register ConfigBox::Adapters::Env
