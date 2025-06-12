require "ruby_llm/tool"

module Tools
  class EmbedFile < RubyLLM::Tool
    description <<~DESCRIPTION
      Create vector embeddings from the contents of a file.
      
      This reads a file and converts its entire content into numerical vectors that can be used for:
      - Semantic search across code files
      - Finding similar files or functions
      - Code similarity analysis
      - Building code recommendation systems
      
      Returns an array of floating point numbers representing the file's content meaning.
    DESCRIPTION
    
    param :path, desc: "The relative path to the file to create embeddings from"
    param :model, desc: "Optional embedding model to use (defaults to provider's default)", required: false

    def execute(path:, model: nil)
      unless File.exist?(path)
        return { error: "File not found: #{path}" }
      end
      
      if File.directory?(path)
        return { error: "Path is a directory, not a file: #{path}" }
      end
      
      content = File.read(path)
      
      options = {}
      options[:model] = model if model
      
      result = RubyLLM.embed(content, **options)
      
      {
        file_path: path,
        embeddings: result,
        dimensions: result.length,
        file_size: content.length,
        model_used: model || "default"
      }
    rescue => e
      { error: e.message }
    end
  end
end
