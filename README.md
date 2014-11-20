## pushpop-pusher

[Pusher](http://pusher.com) plugin for [Pushpop](https://github.com/keenlabs/pushpop).

### Installation

Add `pushpop-pusher` to your Gemfile:

``` ruby
gem 'pushpop-pusher'
```

or install it as a gem:

``` shell
$ gem install pushpop-pusher
```

### Usage

The `pusher` plugin gives you a DSL to specify a channel to publish and event on, the name of the event and the data payload of the event.

Here's an example:

``` ruby
require 'pushpop-pusher'

job 'trigger an event' do

  pusher do
    channel     'response-times'
    event       'new-response'
    data        { any: "arbitrary",
                  data: "you",
                  want: "to send" }
  end

end
```

`channel` and should be a string that conforms to the [channel naming conventions](https://pusher.com/docs/client_api_guide/client_channels#naming-channels). `event` should be a string and `data` can be any arbitrary data which the Pusher gem will serialize as JSON.

The `sendgrid` plugin requires that the following environment variables are set:

+ `PUSHER_APP_ID`
+ `PUSHER_APP_KEY`
+ `PUSHER_APP_SECRET`

##### Non-DSL methods

Need to trigger multiple events in one step? Need to trigger events on more than just one channel? Need more control over triggering of events? The DSL approach won't be sufficient for you.

Instead, use the `trigger` method exposed by the plugin directly. Here's an example:

``` ruby
require 'pushpop-pusher'

job 'trigger multiple events' do

  step 'send some emails' do

    [{response_time: "100ms"}, {response_time:"150ms"}].each do |data|
      trigger 'response-times', 'new-response', data
    end

  end

end
```

### Contributing

Code and documentation issues and pull requests are welcome.
