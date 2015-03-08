module Confignado
  module Adapters
    class Base
      def initialize(configuration)
        @configuration = configuration
      end

      def key
        fail 'You must override #key in your adapter'
      end

      def process
        fail 'You must override #process in your adapter'
      end
    end
  end
end
