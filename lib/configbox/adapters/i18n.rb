module ConfigBox
  module Adapters
    class I18n < ConfigBox::Adapters::Base
      def self.key
        :i18n
      end

      def process
        ::I18n.load_path += Dir[@configuration[:load_path]]
      end
    end
  end
end

ConfigBox.register ConfigBox::Adapters::I18n
