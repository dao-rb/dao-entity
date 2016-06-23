module Dao
  module Entity
    class Base
      include Virtus.model

      attr_accessor :initialized_with

      def initialize(attrs = {})
        super
        @initialized_with = []
        @entity_state = self.class.state_class.new(attributes)
      end

      def initialized_with=(attrs)
        @initialized_with = attrs.presence || []
      end

      def persisted?
        id.present? if respond_to?(:id)
      end

      def entity_state
        @entity_state.tap { |s| s.assign_attributes(attributes) }
      end

      def to_key
        key = respond_to?(:id) && id
        key ? [key] : nil
      end

      def hash
        "#{ self.class.name }/#{ identity }".hash
      end

      def ==(other)
        hash == other.hash
      end

      def <=>(other)
        id <=> other.id
      end

      alias eql? ==
      alias equal? eql?

      private

      def self.state_class
        @state_class ||= State.build_with_attrs(attribute_set.collect(&:name))
      end

      def identity
        if respond_to?(:id)
          id
        else
          object_id
        end
      end
    end
  end
end
