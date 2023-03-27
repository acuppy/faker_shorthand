require "test_helper"
require_relative "test_ext"

class Faker::ShorthandTest < Minitest::Test
  def matcher
    Faker::Shorthand::Matcher.new
  end

  def test_that_it_has_a_version_number
    refute_nil ::Faker::Shorthand::VERSION
  end

  def test_raise_when_faker_module_doesnt_exist
    assert_raises(Faker::Shorthand::MatcherModuleError) do
      matcher.foo.bar
    end
  end

  def test_raise_when_faker_module_method_doesnt_exist
    assert_raises(Faker::Shorthand::MatcherMethodError) do
      matcher.test.not_a_valid_method
    end
  end

  def test_passing_a_valid_matcher
    assert_equal matcher.test.word, 'foo'
  end

  def test_converts_multiword_matchers_to_classified_modules_names
    m_1 = matcher.test
    m_2 = matcher.test_multi

    assert_equal Faker::Test, m_1.instance_variable_get(:@klass)
    assert_equal Faker::TestMulti, m_2.instance_variable_get(:@klass)
  end

  def test_passes_args_through_to_faker_method_call
    m_obj = matcher.test
    assert_equal m_obj.method_with_arguments(foo: 'bar'), 'bar'
  end
end
