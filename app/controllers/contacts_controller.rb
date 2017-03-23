class ContactsController < ApplicationController
  
  def index 
    @contacts = Contact.all 
    render "index.html.erb"
  end 
  
  def new 
    render "new.html.erb"
  end 

  def create 

    contact = Contact.new(
      first_name: params[:first_name], 
      last_name: params[:last_name], 
      middle_name: params[:middle_name], 
      phone_number: params[:phone_number], 
      email: params[:email],
      user_id: current_user.id
      )
    contact.save
    contact_id=params[:id]
    flash[:success] = "Contact Successfully Created"
    render "create.html.erb"
  end 

  def show 
    @contact = Contact.show_by(params[:id])
    render "show.html.erb"
  end 

  def edit 
    @contact = Contact.show_by(params[:id])
    render "edit.html.erb"
  end 

  def update 

  end 

  # def first_contact_method
  #   @contact = Contact.first
  #   render "first_contact.html.erb"
  # end 

  # def second_contact_method
  #   @contact = Contact.second
  #   render "second_contact.html.erb"
  # end 

  # def all_contacts_method
  #   @contacts = Contact.all
  #   render "all_contacts.html.erb"
  # end 

  # def form_results_method
  #   @first_name = params["first_name"]
  #   @last_name = params["last_name"]
  #   render "contact_result.html.erb"
  # end 
end
