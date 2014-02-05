class AccountsController < ApplicationController

  def destroy
    Account.find(params[:id]).destroy
    flash[:success] = "Account destroyed."
    redirect_to tftps_url
  end

  def index
    @accounts = @accounts = Account.paginate(page: params[:page])
  end

  def new
   @account = Account.new
  end

  def create
    @account = Account.new(params[:account])
    if @account.save
        flash[:success] = "Account added"
        redirect_to account_url
    else
      render 'new'
    end
  end

  def edit
   @account = Account.find(params[:id])
  end

  def update
   @account = Account.find(params[:id])
    if @account.update_attributes(params[:account])
      flash[:success] = "Account updated"
      redirect_to tftps_url
    else
      render 'edit'
   end
   def mail
     @accounts = Account.all
   end
  end
 
