require 'redis'

RSpec.describe Redis do

  subject { Redis.new }

  describe '#redis-cache' do
      let(:input) { 'my_key' }
      let(:output) { subject.set(input, "hello world") }
      it 'set key returns OK' do
        expect(output).to eq("OK")
      end
      it 'get my_key returns \'hello world\'' do
        expect(subject.get('my_key')).to eq("hello world")
      end
      it 'delete my_key returns nil' do
        subject.del('my_key')
        expect(subject.get('my_key')).to eq(nil)
      end
  end

end
