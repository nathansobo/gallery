dir = File.dirname(__FILE__)
require "#{dir}/../spec_helper"

describe Gallery::Generator do
  it "works" do
    fixtures_path = "#{dir}/../fixtures"
    generator = Gallery::Generator.new(fixtures_path)
        
    puts generator.generate({
      :current_job => {
        :date => "7-31-08",
        :number => 2392,
        :href => "http://moose.com"
      },      
      :archives => [
        {
          :date => "5-30-08",
          :number => 2391,
          :href => "#"
        },
        {
          :date => "3-15-08",
          :number => 2390,
          :href => "#"          
        },
        {
          :date => "3-01-08",
          :number => 2388,
          :href => "#"          
        }
      ]
    })
  end
end