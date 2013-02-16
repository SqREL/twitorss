require './models/user'

DataMapper.auto_upgrade!

class TwiToRSS < Sinatra::Base
  helpers Sinatra::XMLHelper

  get '/' do
    redirect '/index.html'
  end

  get '/auth/twitter/callback' do
    auth = request.env['omniauth.auth']
    user = User.first(:token => auth.credentials.token)
    unless user
      user = User.create(
        login: auth.info.nickname,
        token: auth.credentials.token,
        secret: auth.credentials.secret
      )
    end
    redirect "/#{user.token}.rss"
  end

  get '/:token.rss' do
    @user = User.first(token: params[:token])
    t = Twitter::Client.new(
      oauth_token:        @user.token,
      oauth_token_secret: @user.secret
    )
    @tweets = t.home_timeline
    builder :home_timeline
  end

  get '/kindofadmin' do
    "Oh, my! We have #{User.count} users signed up!"
  end

end
