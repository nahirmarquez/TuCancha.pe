OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '281141371992155', '1e6d6c12c1e560d62b681dc6c2554874', {:client_options => {:ssl => {:ca_path => "#{Rails.root}/config/ca-bundle.crt"}}, :scope => 'publish_stream,email'}
end