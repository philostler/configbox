module ConfigBox
  module Adapters
    class Env < ConfigBox::Adapters::Base
      def self.key
        :env
      end

      def process
        #
      end
    end
  end
end

ConfigBox.register ConfigBox::Adapters::Env
