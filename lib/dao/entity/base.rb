module Dao
  module Entity
    class Base
      include Virtus.model

      attr_accessor :initialized_with

      def initialize(attrs = {})
        super
        after_initialize
      end

      def after_initialize
        @initialized_with = []
      end

      def initialized_with=(attrs)
        @initialized_with = attrs.presence || []
      end

      def persisted?
        id.present? if respond_to?(:id)
      end

      def to_key
        key = respond_to?(:id) && id
        key ? [key] : nil
      end

      def hash
        "#{ self.class.name }/#{ identity }".hash
      end

      def ==(other)
        other.instance_of?(self.class) && other.identity == identity
      end

      def <=>(other)
        raise ArgumentError, "comparison of #{ self.class.name } with #{ other.class.name } failed" unless other.instance_of?(self.class)
        id <=> other.id
      end

      alias eql? ==

      protected

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
