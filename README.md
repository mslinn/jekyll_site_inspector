`jekyll_site_inspector`
[![Gem Version](https://badge.fury.io/rb/jekyll_site_inspector.svg)](https://badge.fury.io/rb/jekyll_site_inspector)
===========

`jekyll_site_inspector` is a Jekyll tag plugin that displays lots of information from context for websites in development mode if `site_inspector: true` in `_config.yml`.


## Usage

```html
<p>{% site_inspector %}</p>
```
Output is also displayed on the console.


## Additional Information
More information is available on
[Mike Slinn&rsquo;s website](https://www.mslinn.com/blog/2020/10/03/jekyll-plugins.html).


## Installation

Add this line to your application's Gemfile, within the `jekyll_plugins` group:

```ruby
group :jekyll_plugins do
  gem 'jekyll_site_inspector'
end
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install jekyll_site_inspector


## Development

After checking out the repo, run `bin/setup` to install dependencies.

You can also run `bin/console` for an interactive prompt that will allow you to experiment.


### Build and Install Locally
To build and install this gem onto your local machine, run:
```shell
$ rake install:local
```

The following also does the same thing:
```shell
$ bundle exec rake install
jekyll_site_inspector 1.0.0 built to pkg/jekyll_site_inspector-0.1.0.gem.
jekyll_site_inspector (1.0.0) installed.
```

Examine the newly built gem:
```shell
$ gem info jekyll_site_inspector

*** LOCAL GEMS ***

jekyll_site_inspector (1.0.0)
    Author: Mike Slinn
    Homepage:
    https://github.com/mslinn/jekyll_site_inspector
    License: MIT
    Installed at: /home/mslinn/.gems

    Generates Jekyll logger with colored output.
```


### Build and Push to RubyGems
To release a new version,
  1. Update the version number in `version.rb`.
  2. Commit all changes to git; if you don't the next step might fail with an unexplainable error message.
  3. Run the following:
     ```shell
     $ bundle exec rake release
     ```
     The above creates a git tag for the version, commits the created tag,
     and pushes the new `.gem` file to [RubyGems.org](https://rubygems.org).


## Contributing

1. Fork the project
2. Create a descriptively named feature branch
3. Add your feature
4. Submit a pull request


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
