require "ruby_llm"

RubyLLM.configure do |config|
  config.anthropic_api_key = ENV.fetch("ANTHROPIC_API_KEY", nil)
  config.default_model = "claude-3-7-sonnet"
end

require_relative "src/agent"

begin
  Agent.new.run
rescue => e
  puts "Error: #{e.message}"
  puts e.backtrace
end
