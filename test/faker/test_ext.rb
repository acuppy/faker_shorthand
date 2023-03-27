class Faker::Test
  def self.word
    "foo"
  end

  def self.method_with_arguments(foo:)
    foo
  end
end

class Faker::TestMulti < Faker::Test
end