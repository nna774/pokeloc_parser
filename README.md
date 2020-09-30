# PokelocParser

Get bus information from [京都市バス携帯型バスロケシステム 【ポケロケ】](http://www2.city.kyoto.lg.jp/kotsu/blssmart/index.html).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pokeloc_parser'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install pokeloc_parser

## Usage

1. set your information from [ポケロケ](http://blsetup.city.kyoto.jp/blsp/). And you will get URI like `http://blsetup.city.kyoto.jp/blsp/show.php?sid=36428bad4f799a90e5d2be7fbfe99c4c`
2. use the parameter `sid` as id
3. call `PokelocParser.get`

```
irb(main):001:0> d = PokelocParser.get id: '36428bad4f799a90e5d2be7fbfe99c4c'
irb(main):002:0> d
=> #<PokelocParser::Result:0x00007fffedbf18d8 @numbers=[#<PokelocParser::NumberResult:0x00007fffedbe7608 @approaching="接近中のバスがあります。", @number="206", @destination="東山通・北大路BT", @statuses=["バス運行中（この停留所から2つ前までの区間）", "バス運行中（2つ前から4つ前までの区間）", ""]>, #<PokelocParser::NumberResult:0x00007fffedbe5060 @approaching="接近するバスはありません。", @number="4", @destination="四条河原町・上賀茂神社", @statuses=["", "", ""]>, #<PokelocParser::NumberResult:0x00007fffedbe2a90 @approaching="接近中のバスがあります。", @number="特33", @destination="桂駅東口・洛西BT", @statuses=["", "", "バス運行中（4つ前から6つ前までの区間）"]>], @station="京都駅前", @got_at="10:07">
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nna774/pokeloc_parser. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/nna774/pokeloc_parser/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PokelocParser project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/nna774/pokeloc_parser/blob/master/CODE_OF_CONDUCT.md).
