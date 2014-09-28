# @see: https://github.com/zquestz/omniauth-google-oauth2
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_ID"], ENV["GOOGLE_SECRET"],
  {
    :scope => "calendar, gmail.compose, gmail.readonly, https://www.google.com/m8/feeds/", 
    :image_aspect_ratio => :square, 
  }
end
