require 'spec_helper'

describe "Messages" do

	subject { page }

  describe "index" do	
    before { visit messages_path }

    it { should have_content("Message Feed") }
  end

  describe "new" do
  	before { visit new_message_path }

  	it { should have_content("New Message") }

		describe "creating a message" do
			before do
				fill_in "Content", with: "hi!"
				click_button "Send"
			end

			it { should have_content("hi!") }
		end
	end
end
