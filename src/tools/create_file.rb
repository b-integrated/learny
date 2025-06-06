require "ruby_llm/tool"
require "fileutils"

module Tools
  class CreateFile < RubyLLM::Tool
    description "Create a new file with the given content. If the file already exists, it will be overwritten."
    param :path, desc: "The relative path of the file to create"
    param :content, desc: "The content to write to the file"

    def execute(path:, content:)
      # Ensure the directory exists
      dir = File.dirname(path)
      FileUtils.mkdir_p(dir) unless File.directory?(dir)
      
      # Write the file
      File.write(path, content)
      "File created successfully at #{path}"
    rescue => e
      { error: e.message }
    end
  end
end
