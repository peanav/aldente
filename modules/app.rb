class Aldente < Sinatra::Base
  set :root, Proc.new { File.expand_path('..', File.dirname(__FILE__)) }
  set :public_folder, 'assets'
  set :slim, :pretty => true, :disable_escape => true

  get '/' do
    redirect 'auth' unless env['warden'].authenticated?
    @user_js = get_user_js env['warden'].user
    slim :index
  end

  get '/styles/*.css' do |sheet_name|
    content_type :css
    scss :"scss/#{sheet_name}"
  end

  private

  def get_user_js(user)
    user_js = user.instance_variables.reduce('') do |memo, i_var|
      var = i_var[1..-1]
      val = user.send var
      memo += var.include?('password') || (var == 'id') ? "" : "#{var} : '#{val}', "
    end
    user_js[0..-3]
  end
end
