require "ruby_llm"
require_relative "tools/read_file"
require_relative "tools/list_files"
require_relative "tools/edit_file"
require_relative "tools/run_shell_command"
require_relative "tools/create_file"

class Agent
  attr_reader :show_cost

  def initialize(system_message: nil, show_cost: false)
    @chat = RubyLLM.chat(system: system_message) if system_message
    @chat ||= RubyLLM.chat
    @chat.with_tools(Tools::ReadFile, Tools::ListFiles, Tools::EditFile, Tools::CreateFile, Tools::RunShellCommand)
    @show_cost = show_cost
  end

  def run
    puts "Chat with the agent. Type 'exit' to ... well, exit"
    loop do
      print "> "
      user_input = gets.chomp
      break if user_input == "exit"

      response = @chat.ask(user_input) do |chunk|
        print chunk.content
      end
      print "\n---Completed Task---"
      puts response.content
      
      input_tokens = response.input_tokens || 0
      output_tokens = response.output_tokens || 0
      total_tokens = input_tokens + output_tokens
      puts "Total Tokens: #{total_tokens}"
      
      if @show_cost
        # Calculate approximate cost based on Claude-3-7-Sonnet pricing
        # $15 per million input tokens, $75 per million output tokens
        input_cost = input_tokens * (15.0 / 1_000_000)
        output_cost = output_tokens * (75.0 / 1_000_000)
        total_cost = input_cost + output_cost
        puts "Cost: $#{total_cost.round(6)} (Input: $#{input_cost.round(6)}, Output: $#{output_cost.round(6)})"
      end
    end
  end
end
