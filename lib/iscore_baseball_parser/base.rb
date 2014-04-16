require 'roo'
require 'iconv'

module IscoreBaseballParser
  class Base
    attr_reader :workbook
    
    def initialize(file)
      @workbook = if file.end_with? "xls"
        Roo::Excel.new(file)
      elsif file.end_with? "xlsx"
        Roo::Excelx.new(file)
      else
        raise IOError.new("#{file} is an invalid filetype. Acceptable filetypes are .xlsx and .xsl.")
      end
    end
    
    def stats
      @stats ||= IscoreBaseballParser::Stats.new(@workbook).stats
    end
  end
end