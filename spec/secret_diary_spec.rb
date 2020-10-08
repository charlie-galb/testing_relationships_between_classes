require_relative '../lib/secret_diary'

### WARNING ###
# For the purposes of this exercise, you are testing after
# the code has been written. This means your tests are prone
# to false positives!
#
# Make sure your tests work by deleting the bodies of the
# methods in `secret_diary.rb`, like this:
#
# ```ruby
# def write(new_message)
# end
# ```
#
# If they fail, then you know your tests are working
# as expected.
### WARNING ###

RSpec.describe SecretDiary do

  context "when locked" do

    let(:journal) { double('mock diary')}
    let(:message) { "I'm a message" }
    subject(:diary) {SecretDiary.new(journal)}

    it "refuses to be read" do
      expect(diary.read).to eq("Go away!")
    end
    it "refuses to be written" do
      expect(diary.write(message)).to eq("Go away!")
    end
  end
  context "when unlocked" do

    let(:journal) { double('mock diary', read: "Hello!")}
    let(:message) { "I'm a message" }
    subject(:diary) {SecretDiary.new(journal)}

    before do
      diary.unlock
    end

    it "gets read" do
      expect(journal).to receive(:read)
      diary.read
    end

    it "gets written" do
      expect(journal).to receive(:write)
      diary.write(message)
    end
  end
end
