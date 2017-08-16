require "spec_helper"
include Wreddit

RSpec.describe Wreddit do
  it "has a version number" do
    expect(Wreddit::VERSION).not_to be nil
  end

  subject { Wreddit }

  describe '#user' do
      let(:input) { 'learnprogramming' }
      let(:output) { subject.subreddit(input).comments('6u2pjp').title("what_are_some_of_the_challenges_of_building_a").comment("dlpgqkn").parser }
  end
end
