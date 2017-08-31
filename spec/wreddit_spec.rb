require "spec_helper"

RSpec.describe Wreddit do
  it "has a version number" do
    expect(Wreddit::VERSION).not_to be nil
  end

  subject { Wreddit.new }

  describe '#subreddit' do
      let(:input) { 'learnprogramming' }
      let(:output) { subject.subreddit(input).links }
      it 'outputs an array of something' do
        expect(output).not_to be_nil
      end
  end

end
