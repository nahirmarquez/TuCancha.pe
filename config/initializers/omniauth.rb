OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '413452675368305', '8ed6f791c28890fc3ccf5160da4539cb', {:client_options => {:ssl => {:ca_path => "/etc/ssl/certs"}}, :scope => 'publish_stream,email'}
end