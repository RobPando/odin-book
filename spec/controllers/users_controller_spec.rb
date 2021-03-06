require 'rails_helper'

RSpec.describe UsersController do
  describe 'show' do
    context 'user not logged in' do
      it 'redirects to log in page' do
        create(:user)
        get :show, params: { id: 1 }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'index' do
    context 'user not logged in' do
      it 'redirects to log in page' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'edit' do
    context 'user not logged in' do
      it 'redirects to log in page' do
        get :edit, params: { id: 1 }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'update' do
    context 'user not logged in' do
      it 'redirect to log in page' do
        patch :edit, params: { id: 1 }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  context 'denies redirects to sign in path' do
    it 'denies viewing a profile' do
      get :show, params: { id: 1 }
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
