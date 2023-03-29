# Faker::Shorthand (for Ruby)

:tired_face: Tied of writing `Faker::Name.name` over and over again?! Me too. But, you're in luck :smile:, there's a app (gem) for that! With `Faker::Shorthand`, you too can save your shift-key and milliseconds of exta keyboarding...

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'faker-shorthand'
```

Then execute:

    $ bundle install

And last, but not least, add to your preferred test_helper (along with Faker itself):

```ruby
require 'faker/shorthand'
```

## Usage

Instead of `Faker::ChuckNorris.fact` simply write `f.chuck_norris.fact` and :boom: you get everything you've ever wanted (...from that Faker module). The mapping is quite simple.

We have support for single and multiword modules and methods!

In case you're worried, we won't lose those all so valuable keyword and method arguments. Just pass those along, and _we will too_. 

Let our Faker methods be your Faker methods.

## :question: Never Asked Questions:

- "WHAT IF I HATE SHORTHAND?!" No problem. You can use your trusty shift-key to write out all of those capitalized module/class declarations.

- "Hmmm, what about my custom Faker extension?" No problem. It's just shorthand. We don't override any modules. If your version of Faker has it, so do we!

- "I use FactoryBot, can I integrate this glorious shorthand?" Of course - do you think we'd forget about you! No silly human. With one line of code in your `test_helper` of choice and you have shorthand everywhere!!

## FactoryBot integration

Include the following line in your preferred test_helper _after_ requiring FactoryBot:

```ruby

# Do you want this...?
FactoryBot.define do
  factory :user do
    name { f.name.name }
    email { f.internet.email }
  end
end

# Add this to your test_helper or rails_helper
class FactoryBot::SyntaxRunner
  include Faker::Shorthand::Methods
end
```

## Coming soon (launching 2023/4/5-ish)

### Aliases
Shorten the shorthand with a single line of configuration, `f.name.name` will become `f.name`, and `f.name.first_name` to become `f.name.first`.

### Compositions
Who loves combining strings anyways?! Not us at the Institute of Faker::Shorthand. With a touch of configuration, we can make all of that go away. Ask for `f.name.first.and.last` and you've made `"#{Faker::Name.first_name} #{Faker::Name.last_name}` and thing of the past. (This may be a horrible idea. It's not entirely clear at this point.)


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/faker_shorthand. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/faker_shorthand/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the FakerShorthand project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/faker_shorthand/blob/master/CODE_OF_CONDUCT.md).
