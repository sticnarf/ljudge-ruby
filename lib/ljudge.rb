require "ljudge/version"
require 'json'

module Ljudge

  # Examples:
  # args = {
  #   user_code: '/tmp/code.c',
  #   checker_code: '/tmp/checker.rb',
  #   testcase: [
  #     { input: '/tmp/1.in', output: '/tmp/1.out' },
  #     { input: '/tmp/2.in', output: '/tmp/2.out' }
  #   ]
  # }

  # options = {
  #   max_cpu_time: 1,
  #   max_memory: 2**27,
  #   max_compiler_cpu_time: 10
  # }

  # env = {
  #   name1: 'value1',
  #   name2: 'value2'
  # }
  def self.run(args, options, env={})
    command = "ljudge "
    command << to_option_str(args) << to_option_str(options)
    env.each { |key, value| command << "--env #{key} #{value} "}
    output = IO.popen(command, err: [:child, :out]).readlines.join
    begin
      JSON::restore(output)
    rescue JSON::ParserError
      output
    end
  end

  def self.to_option_str(hash)
    str = ""
    hash.each do |key, value|
      if value.is_a? Array
        value.each { |args| str << '--' << key.to_s.gsub(/_/, '-') << ' ' << to_option_str(args) }
      else
        str << '--' << key.to_s.gsub(/_/, '-') << ' '
        str << value.to_s << ' '
      end
    end
    str
  end
end