class StaticPagesController < ApplicationController

  # GET
  def contact
    @message = Message.new
  end

  # POST
  def send_message
    @message = Message.new message_params

    if @message.valid?
      ContactMailer.contact_me(@message).deliver_now
      flash[:success] = "Thanks #{@message.name}. We've received your message!"
      redirect_to contact_url
    else
      render :new
    end
  end

  private

    def message_params
      params.require(:message).permit(:name, :email, :body)
    end

end
