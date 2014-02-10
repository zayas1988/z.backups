class BackupsController < ApplicationController

  def destroy
    Backup.find(params[:id]).destroy
    flash[:success] = "Backup destroyed."
    redirect_to backups_url
  end

  def index
#    @backups = @backups = backup.paginate(page: params[:page])
    @backups = Backup.all
  end
  
  def new
   @backup = backup.new
  end
  def restore
    backup = Backup.find(params[:id])
    backup.restore
    flash[:success] = "#{backup.account.login} at #{backup.created_at} restored"
    redirect_to root_url
  end
  def show
    @backup = Backup.find(params[:id])
  end

  def create
    @backup = backup.new(params[:backup])
    if @backup.save
        flash[:success] = "backup group added"
        redirect_to backups_url
    else
      render 'new'
    end
  end

  def edit
   @backup = backup.find(params[:id])
  end

  def update
   @backup = backup.find(params[:id])
    if @backup.update_attributes(params[:backup])
      flash[:success] = "backup group updated"
      redirect_to backups_url
    else
      render 'edit'
    end
  end

  private

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

end

