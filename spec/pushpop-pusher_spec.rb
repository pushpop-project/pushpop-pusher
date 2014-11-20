require 'spec_helper'
require 'pusher'

describe Pushpop::Pusher do

	describe '#configure' do

		it 'should set various params' do

			step = Pushpop::Pusher.new do
				channel 'some-channel'
				event 'some-event'
				data [{ blah: 'data' }]
			end

			step.configure

			step._channel.should == 'some-channel'
			step._event.should == 'some-event'
      step._data.should == [{ blah: 'data' }]

		end

	end

  describe '#run' do
    it 'should not sent email if nothing is configured' do
      Pusher.stub(:trigger).never
      step = Pushpop::Pusher.new do end
      step.run
    end

    it 'should trigger the event with the expected values' do

      expect(Pusher).to receive(:trigger).with('some-channel', 'some-event', [{ blah: 'data' }])

      step = Pushpop::Pusher.new do
        channel 'some-channel'
        event 'some-event'
        data [{ blah: 'data' }]
      end

      step.run

    end
  end

end
