class ApplicationController < ActionController::Base
 # before_action :authenticate_user!, except: [:top]
 before_action :configure_permitted_parameters, if: :devise_controller?
 #devise利用の機能（ユーザ登録、ログイン認証等）が使われる前にconfigure_permitted_parametersメソッドが実行される。
 
 def after_sign_in_path_for(resource)
  post_images_path
 end
 
 def after_sign_out_path_for(resource)
  about_path
 end 
 
 protected 
 #strong parameterと違い、呼び出された他のコントローラーからも参照可能。

 def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
     #ユーザー登録の際に新たな追加機能のユーザー名のデータ操作を許可。strong parameterと同様、記述をしたコントローラー内でしか操作できない。
 end 
end
