class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  def render_create_success
    render json: {
      status: 200,
      message: '登録に成功しました',
      data: resource_data
    }, status: 200
  end

  def render_create_error
    render json: {
      status: 422,
      message: "登録に失敗しました",
      data: resource_data,
      errors: resource_errors
    }, status: 200
  end

  private
    def sign_up_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
end
