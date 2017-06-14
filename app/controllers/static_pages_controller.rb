class StaticPagesController < ApplicationController

  def contact
    @message = Message.new
  end

  def send_message
    @message = Message.new message_params

    if @message.valid?
      ContactMailer.contact_me(@message).deliver_now
      redirect_to contact_url, notice: "Message received, thanks!"
    else
      render :new
    end
  end

  private

    def message_params
      params.require(:message).permit(:name, :email, :body)
    end

end
