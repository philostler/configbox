module Configbox
  module Adapters
    class Env < Configbox::Adapters::Base
      def self.key
        :env
      end

      def process
        //
      end
    end
  end
end

Configbox.register Configbox::Adapters::Env
