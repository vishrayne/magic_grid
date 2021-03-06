module MagicGrid
  module Order
    class Unordered
      def self.css_class
        'sort-none'
      end
      def self.icon_class
        'ui-icon-carat-2-n-s'
      end
      def self.to_sql
        'ASC'
      end
      def self.to_param
        0
      end
      def self.sorted?
        false
      end
      def self.reverse
        Descending
      end
    end
    class Unsortable < Unordered; end
    class Ascending < Unordered
      def self.css_class
        'sort-asc'
      end
      def self.icon_class
        'ui-icon-triangle-1-n'
      end
      def self.sorted?
        true
      end
      def self.reverse
        Descending
      end
    end
    class Descending < Unordered
      def self.css_class
        'sort-desc'
      end
      def self.icon_class
        'ui-icon-triangle-1-s'
      end
      def self.to_sql
        'DESC'
      end
      def self.to_param
        1
      end
      def self.sorted?
        true
      end
      def self.reverse
        Ascending
      end
    end
    def self.from_param(something)
      case something
      when 1, "1", :desc, :DESC, "desc", "DESC", Descending
        Descending
      #when 0, "0", :asc, :ASC, "asc", "ASC", Ascending
      #  Ascending
      else
        Ascending
      end
    end
  end
end