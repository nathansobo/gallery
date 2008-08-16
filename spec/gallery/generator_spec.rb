dir = File.dirname(__FILE__)
require "#{dir}/../spec_helper"

describe Gallery::Generator do  
  attr_reader :generator
  before do
    fixtures_path = "#{dir}/../fixtures"
    @generator = Gallery::Generator.new(fixtures_path)
  end
  
  describe "#generate" do
    it "takes a recipe and returns an index page based on it" do
      content = generator.generate
      
      content.should match(/2392/)
      content.should match(/2391/)
      content.should match(/2390/)
      
      content.should match(/07\/31\/2008/)
      content.should match(/06\/15\/2008/)
      content.should match(/04\/10\/2008/)

      content.should match(/2392_Silverlign_2008_07_31/)
      content.should match(/2391_Silverlign_2008_06_15/)
      content.should match(/2390_Silverlign_2008_04_10/)
      
      puts content
    end
  end
  
  describe "#recipe" do
    it "returns a recipe based on the target directory" do
      generator.recipe.should == {
        :current_job => {
          :date => "07/31/2008",
          :number => "2392",
          :href => "2392_Silverlign_2008_07_31"
        },
        :archives => [
          {
            :date => "06/15/2008",
            :number => "2391",
            :href => "2391_Silverlign_2008_06_15"
          },
          {
            :date => "04/10/2008",
            :number => "2390",
            :href => "2390_Silverlign_2008_04_10"
          }
        ]
      }
    end
    
    describe "#format_date" do
      it "converts an ugly date to a pretty one" do
        generator.format_date(generator.parse_date('2008_04_10')).should == '04/10/2008'
      end
    end
  end
end