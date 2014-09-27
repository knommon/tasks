require 'sandbox_email_interceptor'
ActionMailer::Base.register_interceptor(SandboxEmailInterceptor) if Rails.env.development?
