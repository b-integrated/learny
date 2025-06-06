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
      puts "Total Tokens: #{(response.input_tokens || 0) + (response.output_tokens || 0)}"
      
      if @show_cost && response.cost
        puts "Cost: $#{response.cost.round(6)}"
      end
    end
  end
end
