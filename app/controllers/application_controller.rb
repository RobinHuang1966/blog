class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  #调用Rails的HTTP Basic认证插件http_authentication，其中http_authentication核心代码basic.rb；
  #参数为&login_procedure，即一个登录代码block
  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      user_name == 'admin' && password == 'admin'
    end
  end
end
