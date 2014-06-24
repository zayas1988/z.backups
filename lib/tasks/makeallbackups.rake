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
