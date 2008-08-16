

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
    
    
    



    
    def recipe
      jobs = []
      Dir.foreach(@path) do |subdir|
        
        match = subdir.match(/^([0-9]+)_([^_]+)_(.+)/)    
        next unless match
        
        number = match[1]
        name = match[2]
        date = match[3]
        
        jobs.push({
          :date => format_date(parse_date(date)),
          :number => number,
          :href => subdir
        })
      end
      
      
      
      {
        :archives => jobs
      }
    end
    
    def parse_date(raw_date)
      pieces = raw_date.split('_')
      year = pieces[0].to_i
      month = pieces[1].to_i
      day = pieces[2].to_i
      Time.utc(year, month, day)
    end
    
    def format_date(date)
      date.strftime("%m/%d/%Y")
    end
    
    
    
  end
end