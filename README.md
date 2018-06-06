# Stax Examples

This project is a bunch of generators for
[stax](https://github.com/rlister/stax), to demonstrate the creation
of stacks and/or individual resources for Cloudformation using `stax`.

Currently, generators all use the
[cfer](https://github.com/seanedwards/cfer) wrapper to generate
templates from ruby code. We may add json and/or yaml template
examples later.

These templates are all just an expression of the author's ideas about
Cloudformation architecture and style. Stacks and highly de-coupled
and orthogonal, and use Outputs/Exports and Imports very heavily to
wire related stacks up to each other.

You are encouraged to use these merely as a starting-point for
boilerplate, and then modify to your needs. Even better, fork and
create generators embodying your opinions instead.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'stax-examples'
```

or use `HEAD` with:

```ruby
gem 'stax-examples', git: 'https://github.com/rlister/stax-examples'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stax-examples

## Usage

`require` the gem wherever you put such things, such as your
`Staxfile`:

```ruby
require 'stax/examples'
```

You should now see your new generators listed:

```sh
$ bundle exec stax g

```

Use a generator by name to create your new boilerplate in `lib/` and
`cf/`, e.g.:

```sh
$ bundle exec stax g vpc
cidr block for vpc? (10.0.0.0/16)
number of subnets to create? (3)
      create  cf
      create  cf/vpc.rb
      create  cf/vpc/endpoints.rb
      create  cf/vpc/subnets.rb
      create  cf/vpc/vpc.rb
      append  Staxfile
```

As seen above, most generators will query interactively for any
decisions they would like you to make.

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/rlister/stax-examples. This project is intended
to be a safe, welcoming space for collaboration, and contributors are
expected to adhere to the [Contributor
Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Stax::Examples project’s codebases, issue
trackers, chat rooms and mailing lists is expected to follow the [code of
conduct](https://github.com/rlister/stax-examples/blob/master/CODE_OF_CONDUCT.md).
