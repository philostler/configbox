module Confignado
  module Adapters
    class I18n < Confignado::Adapters::Base
      def self.key
        :i18n
      end

      def process
        ::I18n.load_path += Dir[@configuration['load_path']]
      end
    end
  end
end

Confignado.register Confignado::Adapters::I18n
