class NotifyUserMailer < ApplicationMailer

	def create_admin(info)
	@admin_user = info
    mail(:to => @admin_user[:new_admin].email, :subject => 'Send Email to Admin' )	
	end

	def approve_account(info)
		@seller_user = info
		mail(:to => @seller_user.email, :subject => 'Admin Approve Your Account' )	
	end

end
