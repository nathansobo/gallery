

module Gallery
  class Generator
    def initialize(path)
      @path = path
    end
    
    def generate(recipe)
      dir = File.dirname(__FILE__)
      File.open("#{dir}/client_index.erb") do |file|
        template = ERB.new(file.read)
        template.result
      end
    end
  end
end