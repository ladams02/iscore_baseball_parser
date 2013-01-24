require_relative '../../../test_helper'

describe IscoreBaseballParser::Players::Fielder do
  subject { IscoreBaseballParser::Players::Fielder }
  
  describe "creating a new object" do
    before do
      @fielder = IscoreBaseballParser::Players::Fielder.new([])
    end
    
    it "should be of appropriate class and super class" do
      assert_instance_of IscoreBaseballParser::Players::Fielder, @fielder
      assert_equal IscoreBaseballParser::Players::Player, @fielder.class.superclass
    end
  end
end