module Timber
  module Events
    # The template render event track template renderings and their performance.
    class TemplateRender
      MESSAGE_MAX_BYTES = 8192.freeze
      NAME_MAX_BYTES = 1024.freeze

      attr_reader :message, :name, :duration_ms

      def initialize(attributes)
        normalizer = Util::AttributeNormalizer.new(attributes)
        @message = normalizer.fetch!(:message, :string, :limit => MESSAGE_MAX_BYTES)
        @name = normalizer.fetch!(:name, :string, :limit => NAME_MAX_BYTES)
        @duration_ms = normalizer.fetch!(:duration_ms, :float, :precision => 6)
      end
    end
  end
end
