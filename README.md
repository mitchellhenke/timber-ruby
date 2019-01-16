# 🌲 Timber - Great Ruby Logging Made Easy

[![ISC License](https://img.shields.io/badge/license-ISC-ff69b4.svg)](LICENSE.md)
[![Yard Docs](http://img.shields.io/badge/yard-docs-blue.svg)](http://www.rubydoc.info/github/timberio/timber-ruby)
[![Build Status](https://travis-ci.org/timberio/timber-ruby.svg?branch=master)](https://travis-ci.org/timberio/timber-ruby)
[![Code Climate](https://codeclimate.com/github/timberio/timber-ruby/badges/gpa.svg)](https://codeclimate.com/github/timberio/timber-ruby)

Timber for Ruby is a drop in replacement for your Ruby logger that
[unobtrusively augments](https://timber.io/docs/concepts/structuring-through-augmentation) your
logs with [rich metadata and context](https://timber.io/docs/concepts/metadata-context-and-events)
making them [easier to search, use, and read](#get-things-done-with-your-logs). It pairs with the
[Timber console](#the-timber-console) to deliver a tailored Ruby logging experience designed to make
you more productive.

1. [**Installation**](#installation)
2. [**Usage** - Simple & powerful API](#usage)
3. [**Integrations** - Automatic context and metadata for your existing logs](#integrations)
4. [**The Timber Console** - Designed for applications & developers](#the-timber-console)
5. [**Get things done with your logs 💪**](#get-things-done-with-your-logs)


## Installation

In your `Gemfile`, add the `timber` gem:

```ruby
gem 'timber', '~> 3.0'
```

## Usage

<details><summary><strong>Basic logging</strong></summary><p>

Use the `Timber::Logger` just like you would `::Logger`:

```ruby
logger.debug("Debug message")
logger.info("Info message")
logger.warn("Warn message")
logger.error("Error message")
logger.fatal("Fatal message")
```

* [Search it](https://timber.io/docs/app/console/searching) with queries like: `error message`
* [Alert on it](https://timber.io/docs/app/console/alerts) with threshold based alerts
* [View this event's metadata and context](https://timber.io/docs/app/console/view-metadata-and-context)

[...read more in our docs](https://timber.io/docs/languages/ruby/usage/basic-logging)

---

</p></details>

<details><summary><strong>Logging events (structured data)</strong></summary><p>

Log structured data without sacrificing readability:

```ruby
logger.warn "Payment rejected", payment_rejected: {customer_id: "abcd1234", amount: 100, reason: "Card expired"}
```

* [Search it](https://timber.io/docs/app/console/searching) with queries like: `type:payment_rejected` or `payment_rejected.amount:>100`
* [Alert on it](https://timber.io/docs/app/console/alerts) with threshold based alerts
* [View this event's data and context](https://timber.io/docs/app/console/view-metadata-and-context)

...[read more in our docs](https://timber.io/docs/languages/ruby/usage/custom-events)

---

</p></details>

<details><summary><strong>Setting context</strong></summary><p>

Add shared structured data across your logs:

```ruby
Timber.with_context(job: {id: 123}) do
  logger.info("Background job execution started")
  # ... code here
  logger.info("Background job execution completed")
end
```

* [Search it](https://timber.io/docs/app/console/searching) with queries like: `job.id:123`
* [View this context when viewing a log's metadata](https://timber.io/docs/app/console/view-metadata-and-context)

...[read more in our docs](https://timber.io/docs/languages/ruby/usage/custom-context)

---

</p></details>

<details><summary><strong>Metrics, Timings, & Tracing</strong></summary><p>

Time code blocks:

```ruby
timer = Timber.start_timer
# ... code to time ...
logger.info("Processed background job", background_job: {time_ms: timer})
```

Log generic metrics:

```ruby
logger.info("Credit card charged", credit_card_charge: {amount: 123.23})
```

* [Search it](https://timber.io/docs/app/console/searching) with queries like: `background_job.time_ms:>500`
* [Alert on it](https://timber.io/docs/app/console/alerts) with threshold based alerts
* [View this log's metadata in the console](https://timber.io/docs/app/console/view-metadata-and-context)

...[read more in our docs](https://timber.io/docs/languages/ruby/usage/metrics-and-timings)

</p></details>

## Integrations

Timber integrates with popular frameworks and libraries to capture context and metadata you
couldn't otherwise. This automatically augments logs produced by these libraries, making them
[easier to search and use](#do-amazing-things-with-your-logs). Below is a list of libraries we
support:

* Frameworks & Libraries
   * [**Rails**](https://timber.io/docs/languages/ruby/integrations/rails)
   * [**Rack**](https://timber.io/docs/languages/ruby/integrations/rack)
   * [**Devise**](https://timber.io/docs/languages/ruby/integrations/devise)
   * [**Clearance**](https://timber.io/docs/languages/ruby/integrations/clearnace)
   * [**Warden**](https://timber.io/docs/languages/ruby/integrations/devise)
* Platforms
   * [**Heroku**](https://timber.io/docs/languages/ruby/integrations/heroku)
   * [**System / Server**](https://timber.io/docs/languages/ruby/integrations/system)

...more coming soon! Make a request by [opening an issue](https://github.com/timberio/timber-ruby/issues/new)


## Get things done with your logs

Logging features designed to help developers get more done:

1. [**Powerful searching.** - Find what you need faster.](https://timber.io/docs/app/console/searching)
2. [**Live tail users.** - Easily solve customer issues.](https://timber.io/docs/app/console/tail-a-user)
3. [**View logs per HTTP request.** - See the full story without the noise.](https://timber.io/docs/app/console/trace-http-requests)
4. [**Inspect HTTP request parameters.** - Quickly reproduce issues.](https://timber.io/docs/app/console/inspect-http-requests)
5. [**Threshold based alerting.** - Know when things break.](https://timber.io/docs/app/alerts)
6. ...and more! Checkout our [the Timber application docs](https://timber.io/docs/app)


## The Timber Console

[![Timber Console](http://files.timber.io/images/readme-interface7.gif)](https://timber.io/docs/app)

[Learn more about our app.](https://timber.io/docs/app)

## Your Moment of Zen

<p align="center" style="background: #221f40;">
<a href="https://timber.io"><img src="http://files.timber.io/images/readme-log-truth.png" height="947" /></a>
</p>
