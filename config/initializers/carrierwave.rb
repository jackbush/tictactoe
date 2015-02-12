CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider  => 'AWS',
    :aws_access_key_id  => ENV['AWS_ACCESS_KEY_ID_WDI_11'],
    :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY_WDI_11'],
    :region  => 'eu-west-1',
  }
  config.fog_directory  = ENV['WDI_11_AWS_WDI_S3_BUCKET'] 
  config.fog_public  = true
end