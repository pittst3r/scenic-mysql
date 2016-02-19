# MySQL adapter for [Scenic](https://github.com/thoughtbot/scenic)

[![Build Status](https://travis-ci.org/sweatypitts/scenic-mysql.svg?branch=master)](https://travis-ci.org/sweatypitts/scenic-mysql)

*Use at your own risk. This is a WIP and you probably shouldn't use it yet.*

Just put this in an initializer and you're ready to go:

```ruby
Scenic.configure do |conf|
  conf.database = Scenic::Adapters::Mysql.new
end
```
