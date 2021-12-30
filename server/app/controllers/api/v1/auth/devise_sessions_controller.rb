class Api::V1::Auth::DeviseSessionsController < DeviseTokenAuth::SessionsController
  def render_create_success
    render json: {
      status: 200,
      message: 'ログインしました',
      data: resource_data(resource_json: @resource.token_validation_response),
    }, status: 200
  end

  def render_create_error_not_confirmed
    data = {
      status: 401,
      message: '認証に失敗しました',
    }
    render_error(
      200,
      I18n.t('devise_token_auth.sessions.not_confirmed', email: @resource.email),
      data: data,
    )
  end

  def render_create_error_bad_credentials
    data = {
      status: 401,
      message: '認証に失敗しました',
    }
    render_error(
      200,
      I18n.t('devise_token_auth.sessions.bad_credentials'),
      data: data,
    )
  end
end
