module ActiveRecord
  class DynamicExistMatch
    def self.match(method)
      df_match = self.new(method)
      df_match.attribute_names ? df_match : nil
    end

    def initialize(method)
      case method.to_s
      when /^exists_by_([_a-zA-Z]\w*)\?$/
        names = $1
        @attribute_names = names && names.split('_and_')
      end
    end

    attr_reader :attribute_names
  end
end
