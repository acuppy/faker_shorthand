require 'faker'
require_relative "faker_shorthand/matcher"
require_relative "faker_shorthand/methods"

module Faker
  module Shorthand
    VERSION = "0.1.0"

    class MatcherModuleError < StandardError
      def initialize(module_name)
        super "No Faker module matches Faker::#{module_name}"
      end
    end
  
    class MatcherMethodError < StandardError
      def initialize(module_name, method_name)
        super "No generator method matches Faker::#{module_name}.#{method_name}"
      end
    end
  
    class MatcherArgumentError < ArgumentError
      def initialize(module_name, method_name, e)
        super "Faker::#{module_name}.#{method_name}: #{e}"
      end
    end
  end
end