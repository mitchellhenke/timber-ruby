# 🌲 Timber - Beautiful, Fast, Powerful Ruby Logging

[![ISC License](https://img.shields.io/badge/license-ISC-ff69b4.svg)](LICENSE.md)
[![Yard Docs](http://img.shields.io/badge/yard-docs-blue.svg)](http://www.rubydoc.info/github/timberio/timber-ruby)
[![Build Status](https://travis-ci.org/timberio/timber-ruby.svg?branch=master)](https://travis-ci.org/timberio/timber-ruby)
[![Code Climate](https://codeclimate.com/github/timberio/timber-ruby/badges/gpa.svg)](https://codeclimate.com/github/timberio/timber-ruby)

[Timber.io][timber] is a hosted service for aggregating logs across your entire stack -
any language, any platform, any data source.

Unlike traditional logging tools, Timber integrates with language runtimes to automatically
capture in-app context and metadata, turning your text-based logs into rich structured events.
Timber integrates with Ruby through this library. And Timber's free-form query tools, real-time
tailing, and graphing make using your logs easier than ever.

The result: Beautiful, fast, powerful Ruby logging.

* [Getting started](#getting-started)
* [Usage](#usage)
* [Integrations](#integrations)
* [Performance & Reliability](#performance-reliability)

## Getting Started

1. Grab your API key at [Timber.io][signup].

2. In your `Gemfile`, add the `timber` gem:

    ```ruby
    gem 'timber', '~> 3.0'
    ```

3. In `config/environments/production.rb` add the `Timber::Logger` at the _bottom_:

    ```ruby
    # config/environments/production.rb`
    config.logger = Timber::Logger.new('{{your-timber-api-key}}')
    ```

    **Be sure to remove any previous `config.logger = ` calls!**

### Testing the pipes

You can test the Timber integration locally if you'd like:

```
rails console
```

And then:

```ruby
logger = Timber::Logger.new('{{your-timber-api-key}}')
logger.info("Testing the pipes")
```

You will see this message appear in your [Timber console][timber_console]. If not, please
[contact support][support], we are happy to assist with setup.

### What about non-Rails applications?

Step 3 above is Rails specific since that is the common case. You'll notice though, that
using the Timber logger is as simple as instantiating a `Timber::Logger` object with your
API key. Depending on your framework, you'll want to assign this object to a global variable
similar to how `Rails.logger` is available globally. Many frameworks provide a means for setting
global configuration and state.

## Usage

Timber works just like the [Ruby `Logger`][ruby_logger], making it dead simple to adopt:

```ruby
Timber.with_context(user: {id: "5c06a0df5f37972e07cb7213"}) do
  Rails.logger.info("Order #1234 placed", order_placed: {id: 1234, total: 100.54})
end
```

Produces the following event:

```json
{
  "dt": "2019-01-29T17:11:48.992670Z",
  "level": "info",
  "message": "Order #1234 placed",
  "order_placed": {
    "id": 1234,
    "total": 100.54
  },
  "context": {
    "user": {
      "id": "5c06a0df5f37972e07cb7213"
    },
    "system": {
      "pid": 20643,
      "hostname": "ec2-44-125-241-8"
    }
  }
}
```

Allowing you to run queries like:

* Tail a user: `context.user.id:5c06a0df5f37972e07cb7213`
* Find orders of a certain value: `order_placed.total:>=100`
* View logs in the context of a single host: `context.system.hostname:"ec2-44-125-241-8"`

See more usage examples in [our Ruby documentation][docs].

## Integrations

Extend Timber's context and metadata capture into 3rd party libraries:

* [`Rack`](https://github.com/timberio/timber-ruby-rack) - Augment `Rack` logs with context and metadata.
* [`Rails`](https://github.com/timberio/timber-ruby-rails) - Augment `Rails` logs with context and metadata.

## Performance & Reliability

Extreme care was taken into the design of Timber to be fast and reliable:

1. Log data is buffered and flushed on an interval to optimize performance and delivery.
2. Timber uses a [simple in-memory fixed sized queue][http_queue] to control memory usage and
   ensure log volume fluctuations do not disrupt application performance in any way.
3. The Timber HTTP backend uses a controlled [multi-buffer][multi_buffer] design to efficiently
   ship data to the Timber service.
4. Connections are re-used and rotated to ensure efficient and reliabile delivery of log data.
5. Delivery failures are retried with an exponential backoff, maximizing successful delivery.
6. [Msgpack][msgpack] is used for payload encoding for it's superior performance and memory
   management.
7. The Timber service ingest endpoint is HA servce designed to handle extreme fluctuations of
   volume and responds in under 50ms.

---

<p align="center">
<a href="mailto:support@timber.io">Support</a> &bull;
<a href="https://timber.io">Timber.io</a>
</p>

[docs]: https://docs.timber.io/languages/ruby
[msgpack]: https://msgpack.org/index.html
[multi_buffer]: https://en.wikipedia.org/wiki/Multiple_buffering
[ruby_logger]: https://docs.ruby-lang.org/en/2.4.0/Logger.html
[signup]: https://app.timber.io
[timber]: https://timber.io
