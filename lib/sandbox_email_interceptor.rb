class SandboxEmailInterceptor
	def self.delivering_email(message)
		message.subject = "#{message.to} #{message.subject}"
		message.to = [ENV['MAIL_USER']]
	end
end
