require_relative '../../../test_helper'

describe IscoreBaseballParser::Players::Batter do
  subject { IscoreBaseballParser::Players::Batter }
  
  describe "creating a new object" do
    before do
      @batter = IscoreBaseballParser::Players::Batter.new([])
    end
    
    it "should be of appropriate class and super class" do
      assert_instance_of IscoreBaseballParser::Players::Batter, @batter
      assert_equal IscoreBaseballParser::Players::Player, @batter.class.superclass
    end
  end
end