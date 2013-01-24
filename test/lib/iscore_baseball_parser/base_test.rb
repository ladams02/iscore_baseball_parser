require_relative '../../test_helper'

describe IscoreBaseballParser::Base do
  subject { IscoreBaseballParser::Base }
  
  describe "creating a new object with an invalid filetype spreadsheet" do
    before do
      @spreadsheet_file = "./test/fixtures/statsheet.csv"
    end
    
    it "should raise exception" do
      assert_raises IOError do
        subject.new(@spreadsheet_file)
      end
    end
  end
  
  describe "creating a new object with a valid xls filetype" do
    before do
      @spreadsheet_file = "./test/fixtures/statsheet.xls"
      @parser = subject.new(@spreadsheet_file)
    end
    
    it "should create a valid workbook" do
      assert_instance_of Excel, @parser.workbook
    end
    
    it "should return stats" do
      assert_instance_of IscoreBaseballParser::Stats, @parser.stats
    end
  end

  describe "creating a new object with a valid xlsx filetype" do
    before do
      @spreadsheet_file = "./test/fixtures/statsheet.xlsx"
      @parser = subject.new(@spreadsheet_file)
    end
    
    it "should create a valid workbook" do
      assert_instance_of Excelx, @parser.workbook
    end
    
    it "should return stats" do
      assert_instance_of IscoreBaseballParser::Stats, @parser.stats
    end
  end
end