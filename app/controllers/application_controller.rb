class ApplicationController < ActionController::Base
  #其中的protect_from_forgery方法啟動了CSRF安全性功能,
  #非GET的HTTP request都必須帶有一個Token參數才能存取,<%= csrf_meta_tag %>
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
