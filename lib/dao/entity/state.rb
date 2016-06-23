module Dao
  module Entity
    class State
      include ActiveModel::Dirty

      def self.build_with_attrs(attrs)
        state = Class.new(self)

        state.define_attribute_methods *attrs

        state.send(:attr_accessor, *attrs)
        attrs.each do |attr|
          state.send(:define_method, "#{ attr }=") do |val|
            if public_send(attr) != val
              attribute_will_change!(attr)
              instance_variable_set("@#{ attr}", val)
            end
          end
        end

        state
      end

      def initialize(params={})
        assign_attributes(params)
        changes_applied
      end

      def assign_attributes(params)
        params.each do |attr, value|
          self.public_send("#{attr}=", value)
        end
      end

      def reload!
        clear_changes_information
      end

      def rollback!
        restore_attributes
      end
    end
  end
end
