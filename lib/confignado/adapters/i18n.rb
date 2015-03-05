module Confignado
  module Adapters
    class I18n < Confignado::Adapters::Base
      def key
        :i18n
      end

      def process
        I18n.load_path += Dir[File.join @data[:load_path]]
      end
    end
  end
end
