require File.expand_path(File.dirname(__FILE__) + "/../../config/environment")

namespace :accounts do
  desc "Make all accounts backup"
  task(:makeallbackups) do
    @accounts=Account.all
    @accounts.each do |account|
      account.makebackup
    end
  end
end

namespace :accounts do
  desc "Make last backups"
  task(:deletelastbackups) do
    @accounts=Account.all
    @accounts.each do |account|
      @account.backups.first.destroy  
    end
  end
end
