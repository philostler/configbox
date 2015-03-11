module Configbox
  module Adapters
    class I18n < Configbox::Adapters::Base
      def self.key
        :i18n
      end

      def process
        ::I18n.load_path += Dir[@configuration['load_path']]
      end
    end
  end
end

Configbox.register Configbox::Adapters::I18n
