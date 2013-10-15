require 'spec_helper'

describe Message do
	before { @message = Message.new(content: "hi!") }

  subject { @message }

  it { should respond_to(:content) }
  it { should be_valid }

  describe "when content is not present" do
  	before { @message.content = " " }

  	it { should_not be_valid }
  end
end