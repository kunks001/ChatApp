class MessagesController < ApplicationController

	def index
		@messages = Message.all
	end

	def new
		@message = Message.new
	end

	def create
		@message = Message.create(message_params)
    if @message.save
      WebsocketRails[:chat].trigger 'new', @message
      redirect_to messages_path
    else
      render 'new'
    end
	end

	def show
		@message = message.find(params[:id])
	end

	private

		def message_params
			params.require(:message).permit(:content)
		end
end
