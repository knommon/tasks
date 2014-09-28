Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"],
      {
        :scope => "userinfo.email, userinfo.profile, calendar, gmail.compose, gmail.readonly, https://www.google.com/m8/feeds/", 
        :image_aspect_ratio => "square",
      }
end
