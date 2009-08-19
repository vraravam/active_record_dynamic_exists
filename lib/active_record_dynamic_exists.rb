module ActiveRecord
  class Base
    class << self
      def respond_to?(method_id, include_private = false)
        if match = DynamicExistMatch.match(method_id)
          return true if all_attributes_exists?(match.attribute_names)
        end
        super
      end

      # Enables dynamic finders like exists_by_user_name?(user_name) and exists_by_user_name_and_password?(user_name, password) that are turned into
      # exists?(["user_name = ?", user_name]) and  exists?(["user_name = ? AND password = ?", user_name, password])
      # respectively.
      #
      # Each dynamic finder is also defined in the class after it is first invoked, so that future
      # attempts to use it do not run through method_missing.
      def method_missing(method_id, *arguments, &block)
        if match = DynamicExistMatch.match(method_id)
          attribute_names = match.attribute_names
          super unless all_attributes_exists?(attribute_names)
          self.class_eval %{
            def self.#{method_id}(*args)
              exists?(construct_attributes_from_arguments([:#{attribute_names.join(',:')}], args))
            end
          }, __FILE__, __LINE__
          send(method_id, *arguments)
        else
          super
        end
      end
    end
  end
end
