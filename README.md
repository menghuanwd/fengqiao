# Fengqiao

顺丰快递常用接口，如有其它接口，请提PR或者联系本人更新

## Installation

```ruby
gem 'fengqiao'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fengqiao

## Usage

### Config

在Rails的initialize中添加
```
Fengqiao.code = ''
Fengqiao.check_word = ''
Fengqiao.custid = ''
```

下订单接口
```
Fengqiao::Service.new.order(order_id, *args)
```

订单结果查询接口
```
Fengqiao::Service.new.query_search(order_id)
```

订单取消接口
```
Fengqiao::Service.new.order_cancel(order_id)
```

路由查询接口
```
Fengqiao::Service.new.route(order_id)
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/fengqiao. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Fengqiao project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/fengqiao/blob/master/CODE_OF_CONDUCT.md).
