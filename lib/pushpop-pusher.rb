require 'pushpop'
require 'pusher'

Pusher.app_id = ENV['PUSHER_APP_ID']
Pusher.key = ENV['PUSHER_APP_KEY']
Pusher.secret = ENV['PUSHER_APP_SECRET']

module Pushpop

  class Pusher < Step

    PLUGIN_NAME = 'pusher'

    Pushpop::Job.register_plugin(Pusher::PLUGIN_NAME, self)

    attr_accessor :_channel
    attr_accessor :_event
    attr_accessor :_data

    def run(last_response=nil, step_responses=nil)

      self.configure(last_response, step_responses)

      if _channel && _event && _data
        trigger(_channel, _event, _data)
      end

    end

    def trigger(_channel, _event, _data)
      ::Pusher.trigger(_channel, _event, _data)
    end

    def configure(last_response=nil, step_responses=nil)
      self.instance_exec(last_response, step_responses, &block)
    end

    # The channel name to trigger the event on
    def channel(channel)
      self._channel = channel
    end

    # The name of the event to trigger on the channel
    def event(event)
      self._event = event
    end

    # The data payload to send with the event
    def data(data)
      self._data = data
    end

  end

end
