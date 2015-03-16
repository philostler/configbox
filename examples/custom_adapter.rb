module YourApplication
    module CustomAdapter < ConfigBox::Adapters::Base
      def key
        :your_key
      end

      def process
        # Logic... access data via @configuration
      end
    end
  end
end
