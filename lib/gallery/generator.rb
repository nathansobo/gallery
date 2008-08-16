

module Gallery
  class Generator
    def initialize(path)
      @path = path
    end
    
    def generate(recipe)
      dir = File.dirname(__FILE__)      
      template = ERB.new(File.read("#{dir}/client_index.erb"))
      template.result(binding)
      
    end
  end
end