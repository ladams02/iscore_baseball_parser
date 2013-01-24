require_relative '../../test_helper'

describe IscoreBaseballParser::Stats do
  subject { IscoreBaseballParser::Stats }
  
  describe "creating a new object with a workbook" do
    before do
      @spreadsheet_file = "./test/fixtures/statsheet.xls"
      @workbook = IscoreBaseballParser::Base.new(@spreadsheet_file).workbook
      @stats = subject.new(@workbook)
    end
    
    it "should create valid attributes for workbook sheets" do
      @workbook.sheets.each do |sheet|
        sheet = sheet.gsub("-", "_").downcase
        assert_respond_to(@stats, sheet.to_sym)
        assert_instance_of Array, @stats.send(sheet.to_sym)
      end
    end
    
    it "should parse stats" do
      assert_equal @workbook.sheets, @stats.parse
    end
    
    it "should return stats" do
      assert_instance_of IscoreBaseballParser::Stats, @stats.stats
    end
  end
end