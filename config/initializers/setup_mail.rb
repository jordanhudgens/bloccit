if Rails.env.development?
    ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.smtp_settings = {
        :address            =>  'smtp.sendgrid.net',
        :port               =>  '587',
        :authentication     =>  :plain,
        :user_name          =>  'app20255950@heroku.com',
        :password           =>  'shkcdui8',
        :domain             =>  'heroku.com',
        :enable_starttle_auto   =>  true
    }
end
