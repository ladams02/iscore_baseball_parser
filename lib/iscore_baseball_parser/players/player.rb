module IscoreBaseballParser
  module Players
    class Player
      CATEGORY_MAP = {'#' => 'num', '/' => '_', '%' => '', '1b' => 'singles', '2b' => 'doubles', '3b' => 'triples'}
      
      def initialize(categories)
        @categories = {}
        
        categories.each_with_index do |category, i|
          category = clean_category(category)
          @categories[i] = category
          
          self.class.__send__(:attr_accessor, category) if category.length > 0
        end
      end
      
      def parse_row(row)
        row.each_with_index do |value, i|
          self.send("#{@categories[i]}=", value)
        end
      end
      
      private
      def clean_category(category)
        new_category = category.downcase
        CATEGORY_MAP.each_pair { |key, value| new_category.gsub!(key, value) }
        
        return new_category
      end
    end
    end
end