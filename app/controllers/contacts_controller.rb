class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      flash[:success] = "お問い合わせを受け付けました"
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @contacts = Contact.page(params[:page]).per(5).sorted
  end

  private
  
  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

end
