OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '408465642594861','ee1adf9d5d42f3ec992c64ee0d0ce35d'
end