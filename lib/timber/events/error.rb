require "timber/util"

module Timber
  module Events
    # The error event is used to track errors and exceptions.
    #
    # @note This event should be installed automatically through integrations,
    #   such as the {Integrations::ActionDispatch::DebugExceptions} integration.
    class Error
      BACKTRACE_JSON_MAX_BYTES = 8192.freeze
      MESSAGE_MAX_BYTES = 8192.freeze

      attr_reader :name, :error_message, :backtrace_json

      def initialize(attributes)
        normalizer = Util::AttributeNormalizer.new(attributes)
        @name = normalizer.fetch!(:name, :string)
        @error_message = normalizer.fetch(:error_message, :string, :limit => MESSAGE_MAX_BYTES)
        @backtrace_json = normalizer.fetch(:backtrace, :array).to_json.byteslice(0, BACKTRACE_JSON_MAX_BYTES)
      end

      def message
        message = "#{name}"

        if !error_message.nil?
          message << " (#{error_message})"
        end

        message
      end
    end
  end
end
