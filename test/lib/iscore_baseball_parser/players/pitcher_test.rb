require_relative '../../../test_helper'

describe IscoreBaseballParser::Players::Pitcher do
  subject { IscoreBaseballParser::Players::Pitcher }
  
  describe "creating a new object" do
    before do
      @pitcher = IscoreBaseballParser::Players::Pitcher.new([])
    end
    
    it "should be of appropriate class and super class" do
      assert_instance_of IscoreBaseballParser::Players::Pitcher, @pitcher
      assert_equal IscoreBaseballParser::Players::Player, @pitcher.class.superclass
    end
  end
end