require "ruby_llm"
require_relative "tools/read_file"
require_relative "tools/list_files"
require_relative "tools/edit_file"
require_relative "tools/run_shell_command"
require_relative "tools/create_embeddings"
require_relative "tools/embed_file"

class Agent
  def initialize
    @chat = RubyLLM.chat
    @chat.with_tools(Tools::ReadFile, Tools::ListFiles, Tools::EditFile, Tools::RunShellCommand, Tools::CreateEmbeddings, Tools::EmbedFile)
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
    end
  end
end
