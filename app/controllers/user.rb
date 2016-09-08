class BookmarkManager < Sinatra::Base
  get '/sign_up' do
    erb :'users/sign_up'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.id == nil
      flash[:error] = user.errors.full_messages.first
      flash[:email] = params[:email]
      redirect '/sign_up'
    else
      session[:user_id] = user.id
    redirect '/links'
    end
  end

  get '/sign_in' do
    erb :'users/sign_in'
  end

  post '/sign_in' do
    user = User.authenticate(params[:email], params[:password])
    if user.nil?
      flash[:error] = 'Invalid Email/Password'
      redirect '/sign_in'
    else
      session[:user_id] = user.id
      redirect '/links'
    end
  end

  get '/sign_out' do
    user = User.get(session[:user_id])
    flash[:message] = "Goodbye, #{user.email}"
    session[:user_id] = nil
    redirect '/links'
  end

end
