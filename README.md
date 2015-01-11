# ljudge-ruby

Ruby binding for [ljudge](https://github.com/quark-zju/ljudge)

## Installation

First, install `ljudge` along with `lrun` referring to [ljudge project page](https://github.com/quark-zju/ljudge).

If you use bundler, add this line to your application's Gemfile:

```ruby
gem 'ljudge'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ljudge

## Usage

```ruby
require 'ljudge'

args = {
  user_code: '/tmp/a.c',
  checker_code: '/tmp/checker.rb',
  testcase: [
    { input: '/tmp/1.in', output: '/tmp/1.out' },
    { input: '/tmp/2.in', output: '/tmp/2.out' }
  ]
}

options = {
  max_cpu_time: 1,
  max_memory: 2**27,
  max_compiler_cpu_time: 10
}

Ljudge.run(args, options)
#=> {"checkerCompilation"=>{"log"=>"", "success"=>true}, "compilation"=>{"log"=>"", "success"=>true}, "testcases"=>[{"memory"=>131072, "result"=>"ACCEPTED", "time"=>0.001}, {"memory"=>221184, "result"=>"WRONG_ANSWER", "time"=>0.001}]}
```
