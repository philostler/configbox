module Confignado
  module Adapters
    class ActiveModelSerializers < Confignado::Adapters::Base
      def key
        :active_model_serializers
      end

      def process
        ActiveModel::Serializer.root = @data[:root]
        ActiveModel::ArraySerializer.root = @data[:array_root]
      end
    end
  end
end
