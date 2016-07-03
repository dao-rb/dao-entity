# Dao::Entity

[![Build Status](https://travis-ci.org/dao-rb/dao-entity.svg?branch=master)](https://travis-ci.org/dao-rb/dao-entity)
[![Code Climate](https://codeclimate.com/github/dao-rb/dao-entity/badges/gpa.svg)](https://codeclimate.com/github/dao-rb/dao-entity)
[![Test Coverage](https://codeclimate.com/repos/5772c7700d9c6e0067002c74/badges/2376d7e0731cb6672a41/coverage.svg)](https://codeclimate.com/repos/5772c7700d9c6e0067002c74/coverage)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dao-entity'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dao-entity

## Usage

```ruby
require 'dao/entity'

class CommentEntity < Dao::Entity::Base
  attribute :body, String
end

class PostEntity < Dao::Entity::Base
  attribute :id,       Integer
  attribute :body,     String

  attribute :comments, Array[CommentEntity]
end

post = PostEntity.new(id: 1, body: 'Post body', comments: [{ id: 1, body: 'Comment body' }])

post.id # => 1
post.body # => "Post body"
post.comments # => [#<CommentEntity:0x007ffdcb923a30>]

post.body = 'New body'
post.entity_state.body_changed? # => true
post.entity_state.body_was # => "Post body"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dao-rb/dao-entity.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
