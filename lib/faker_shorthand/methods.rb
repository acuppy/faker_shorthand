module Faker
  module Shorthand
    module Methods
      def fake
        Faker::Shorthand::Matcher.new
      end
    
      alias_method :f, :fake
    end
  end
end