# encoding: utf-8
class Backup < ActiveRecord::Base
#  attr_accessible :path
  belongs_to :account
  validates(:path, presence: true)
  def test
    @result = %x(touch /tmp/testfile#{self.id})
  end
  def restore
#    @resultmkdir = %x(mkdir /backup/#{self.login})
    @result = %x(sudo -u zimbra /opt/zimbra/bin/zmmailbox -z -m #{self.account.login} postRestURL "//?fmt=tgz&resolve=skip" #{self.path}\.tar\.gz)
    puts "#{self.account.login}"
    puts "#{self.path}"
#    @resultdus = %x(du -b /backup/#{self.login}/#{randid}.tar.gz | awk '{ print $1 }')
#    @backup = self.backups.new(:path => "/backup/#{self.login}", :size => @resultdus.to_i)
 #   puts "#{@resultdus.to_i}"
  #  @backup.save
  end
end
