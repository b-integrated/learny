require "ruby_llm/tool"

module Tools
  class CreateEmbeddings < RubyLLM::Tool
    description <<~DESCRIPTION
      Create vector embeddings for text using AI models.
      
      This converts text into numerical vectors that can be used for:
      - Semantic search and similarity comparisons
      - Clustering similar content
      - Building recommendation systems
      - Text classification tasks
      
      Returns an array of floating point numbers representing the text's meaning.
    DESCRIPTION
    
    param :text, desc: "The text to create embeddings for"
    param :model, desc: "Optional embedding model to use (defaults to provider's default)", required: false

    def execute(text:, model: nil)
      options = {}
      options[:model] = model if model
      
      result = RubyLLM.embed(text, **options)
      
      {
        embeddings: result,
        dimensions: result.length,
        text_length: text.length,
        model_used: model || "default"
      }
    rescue => e
      { error: e.message }
    end
  end
end
