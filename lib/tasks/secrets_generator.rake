namespace :secrets do
    desc "Generate a new secret key"
    task :generate => :environment do
      require 'securerandom'
  
      secret_key = SecureRandom.hex(64)
  
      puts "Generated secret key: #{secret_key}"
  
      # You can save the secret_key to a file or use it as needed in your application
      # For example, you might want to save it to credentials.
    end
  end