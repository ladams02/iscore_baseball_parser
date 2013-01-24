module IscoreBaseballParser
  class Stats
    attr_accessor :stats
    
    def initialize(workbook)
      @workbook = workbook
      @categories = @workbook.sheets.map { |sheet| sheet.gsub("-", "_").downcase }
      
      @categories.each do |category|
        category = category.gsub("-", "_").downcase
        self.class.__send__(:attr_accessor, category)
        self.send("#{category}=", [])
      end
    end
    
    def stats
      @stats ||= self.parse
      
      return self
    end
    
    def parse
      @workbook.sheets.each_with_index do |sheet, idx|
        @workbook.default_sheet = sheet
        category = @categories[idx]
        
        stat_array = if category.start_with?("batting")
          parse_batting(@workbook)
        elsif category.start_with?("pitching")
          parse_pitching(@workbook)
        elsif category.start_with?("fielding")
          parse_fielding(@workbook)
        end
        
        self.send("#{category}=", stat_array)
      end
    end
    
    private
    def parse_batting(worksheet)
      batter = IscoreBaseballParser::Players::Batter.new(worksheet.row(1))
      parse_player(batter, worksheet)
    end
    
    def parse_pitching(worksheet)
      batter = IscoreBaseballParser::Players::Pitcher.new(worksheet.row(1))
      parse_player(batter, worksheet)
    end
    
    def parse_fielding(worksheet)
      batter = IscoreBaseballParser::Players::Fielder.new(worksheet.row(1))
      parse_player(batter, worksheet)
    end
    
    def parse_player(player, worksheet)
      (2..worksheet.last_row-1).map do |i|
        row = worksheet.row(i)
        
        player = player.clone
        player.parse_row(row)
        
        player
      end
    end
  end
end