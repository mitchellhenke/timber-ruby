module Timber
  # Base class for `Timber::Events::*`
  # @private
  class Event
    attr_reader :message, :metadata
    def initialize(message, metadata)
      @message = message
      @metadata = metadata
    end

    def as_json
      @metadata.as_json
    end

    # This ensures that Timber events get logged as messages if they are passed to
    # the standard ::Logger.
    #
    # See: https://github.com/ruby/ruby/blob/f6e77b9d3555c1fbaa8aab1cdc0bd6bde95f62c6/lib/logger.rb#L615
    def inspect
      @message
    end

    def to_json(options = {})
      as_json.to_json(options)
    end

    def to_hash
      @metadata.as_json
    end

    def to_msgpack(*args)
      as_json.to_msgpack(*args)
    end

    def to_s
      @message
    end
  end
end
