module Faker
  module Shorthand
    class Matcher
      def initialize
        @klass  = nil
        @method = nil
      end
    
      def method_missing(method, **args, &block)
        unless @klass
          catch_module_errors { define_faker_class(method) }
          self
        else
          catch_method_errors { send_faker_method(method, **args, &block) }
        end
      end
    
      private
    
        def assert_method?(method)
          @klass.methods(false).include? method.to_sym
        end

        def classify(klass)
          klass.to_s.split('_').collect(&:capitalize).join
        end
        
        def catch_module_errors(&block)
          block.call
        rescue NameError, TypeError => e
          raise MatcherModuleError.new(e)
        end

        def catch_method_errors(&block)
          block.call
        rescue ArgumentError => e
          raise MatcherArgumentError.new(@klass_name, @method, e)
        end

        def define_faker_class(klass_name)
          @klass_name = classify(klass_name)
          @klass ||= Faker.const_get(@klass_name)
        end

        def send_faker_method(method, **args, &block)
          unless assert_method?(method)
            raise MatcherMethodError.new(@klass_name, method)
          end
          
          @method = method
          @klass.public_send(@method, **args, &block)
        end
    end
  end
end