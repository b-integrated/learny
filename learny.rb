require "ruby_llm"

RubyLLM.configure do |config|
  config.anthropic_api_key = ENV.fetch("ANTHROPIC_API_KEY", nil)
  config.default_model = "claude-3-7-sonnet"
  config.track_costs = true # Enable cost tracking in RubyLLM
end

require_relative "src/agent"
require_relative "src/tools/create_file"

# Get the current working directory to provide context to the agent
current_dir = Dir.pwd
puts "Starting agent in directory: #{current_dir}"

# Create initial system message with context about capabilities
system_message = <<~MESSAGE
You are a helpful AI assistant with the ability to interact with the file system.
You can:
- List files in directories
- Read file contents
- Edit existing files
- Create new files
- Run shell commands (with user permission)

You're currently running in: #{current_dir}

When asked to help with code, you can examine the project structure,
read existing code files, and make edits or create new files as needed.
MESSAGE

# Parse command line arguments for configuration
show_cost = ARGV.include?("--show-cost") || ENV["SHOW_COST"] == "true"

Agent.new(system_message: system_message, show_cost: show_cost).run
