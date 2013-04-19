module IscoreBaseballParser
  class Stats
    attr_accessor :stats
    
    def initialize(workbook)
      @workbook = workbook
      @categories = @workbook.sheets.map { |sheet| sheet.underscore }
      
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
        next if @workbook.to_s == "nil" # hack to check for nil workbook
        
        category = @categories[idx]
        
        stat_array = if category.end_with?("batting")
          parse_batting(@workbook)
        elsif category.end_with?("pitching")
          parse_pitching(@workbook)
        elsif category.end_with?("fielding")
          parse_fielding(@workbook)
        end
        
        self.send("#{category}=", stat_array)
      end
    end
    
    private
    def parse_batting(workbook)
      batter = IscoreBaseballParser::Players::Batter.new(workbook.row(1))
      parse_player(batter, workbook, true)
    end
    
    def parse_pitching(workbook)
      pitcher = IscoreBaseballParser::Players::Pitcher.new(workbook.row(1))
      parse_player(pitcher, workbook)
    end
    
    def parse_fielding(workbook)
      fielder = IscoreBaseballParser::Players::Fielder.new(workbook.row(1))
      parse_player(fielder, workbook)
    end
    
    def parse_player(player, workbook, total_row = false)
      last_row = workbook.last_row
      last_row = last_row - 1 if total_row
      
      (2..last_row).map do |i|
        row = workbook.row(i)
        
        player = player.clone
        player.parse_row(row)
        
        player
      end
    end
  end
end