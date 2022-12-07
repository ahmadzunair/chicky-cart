class NotifyUserMailer < ApplicationMailer

	def create_admin(info)
	@admin_user = info
    mail(:to => @admin_user[:new_admin].email, :subject => 'Send Email to Admin' )	
	end

end
