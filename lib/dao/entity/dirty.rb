module Dao
  module Entity
    module Dirty
      extend ActiveSupport::Concern

      def after_initialize
        super
        initialize_entity_state
      end

      def initialize_entity_state
        @in_dump_mode = false
        @entity_state = self.class.state_class.new(attributes)
      end

      def entity_state
        @entity_state.tap { |s| s.assign_attributes(attributes) }
      end

      def _dump(_level)
        prepare_for_dump do
          Marshal.dump(self)
        end
      end

      class_methods do
        def _load(marshal_string)
          Marshal.load(marshal_string).tap(&:initialize_entity_state)
        end

        def state_class
          @_state_class ||= State.build_with_attrs(attribute_set.collect(&:name))
        end
      end

      def respond_to?(*args)
        if args.first == :_dump
          not @in_dump_mode
        else
          super
        end
      end

      protected

      def prepare_for_dump
        current_entity_state = @entity_state
        @entity_state = nil
        @in_dump_mode = true

        result = yield

        @entity_state = current_entity_state
        @in_dump_mode = false

        result
      end
    end
  end
end
