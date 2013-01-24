require_relative '../../../test_helper'

describe IscoreBaseballParser::Players::Player do
  subject { IscoreBaseballParser::Players::Player }
  
  describe "with categories" do
    before do
      @category_map = {'#' => 'num', 'ab/rsp' => 'ab_rsp', 'fp%' => 'fp', '1b' => 'singles', '2b' => 'doubles', '3b' => 'triples'}
      @categories = []
      @category_map.map { |key, value| @categories << key }
    end
    
    describe "creating a player object" do
      before do
        @player = IscoreBaseballParser::Players::Player.new(@categories)
      end
      
      it "should create attributes" do
        @category_map.each_pair do |key, value|
          assert_respond_to @player, value
        end 
      end
    end
  end
end