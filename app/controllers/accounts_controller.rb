class AccountsController < ApplicationController

  def destroy
    Account.find(params[:id]).destroy
    flash[:success] = "Account destroyed."
    redirect_to accounts_url
  end

  def index
#    @accounts = @accounts = Account.paginate(page: params[:page])
    @accounts = Account.all
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
  def show
    @accounts = Account.all
  end
  def showjobs
   @account = Account.find(params[:id])
  end
  def makebackup
    account = Account.find(params[:id])
    account.makebackup
    flash[:success] = "#{account.login} backup created"
    redirect_to root_url
  end
  def update
   @account = Account.find(params[:id])
    if @account.update_attributes(params[:account])
      flash[:success] = "Account updated"
      redirect_to accounts_url
    else
      render 'edit'
   end
  end
end 
