# encoding: utf-8
class Backup < ActiveRecord::Base
#  attr_accessible :path
  belongs_to :account
  validates(:path, presence: true)
  def test
    @result = %x(touch /tmp/testfile#{self.id})
  end
  def restoremailbox
    @result = %x(sudo -u zimbra /opt/zimbra/bin/zmmailbox -z -m #{self.account.login} postRestURL "//?fmt=tgz&resolve=skip" #{self.path}\.mailbox\.tar\.gz)
  end
  def restorecalendar
    @result = %x(sudo -u zimbra /opt/zimbra/bin/zmmailbox -z -m #{self.account.login} postRestURL "/?fmt=tgz&resolve=skip" #{self.path}\.calendar\.tar\.gz)
  end
  def restorecontacts
    @result = %x(sudo -u zimbra /opt/zimbra/bin/zmmailbox -z -m #{self.account.login} postRestURL "/?fmt=tgz&resolve=skip" #{self.path}\.contacts\.tar\.gz)
  end
  def deletefiles
    @result = %x(rm #{self.path}\*)
  end
end
