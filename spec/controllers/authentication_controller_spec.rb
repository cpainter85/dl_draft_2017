require "rails_helper"

describe AuthenticationController do
  let!(:user) { create(:user, email: "jill@email.com", password: "mypassword") }
  let(:login_with_valid_credentials) { post :create, params: { email: user.email, password: user.password } }

  describe "POST create" do

    it "authenticates the user's email and password" do
      expect_any_instance_of(User).to receive(:authenticate).with(user.password)
      login_with_valid_credentials
    end

    context "Provided valid credentials" do
      it "assigns user's id to the session" do
        expect { login_with_valid_credentials }.to change { session[:user_id] }.to(user.id)
      end

      it "sets flash notice to success message" do
        expect { login_with_valid_credentials }.to change { flash[:notice] }.to("You have successfully signed in!")
      end

      it "redirects to the root page" do
        expect(login_with_valid_credentials).to redirect_to(root_path)
      end
    end

    context "Provided invalid credentials" do
      let(:login_with_invalid_credentials ) { post :create, params: { email: "jill@email.com", password: "wrongpassword" } }

      it "flashes an error message" do
        expect { login_with_invalid_credentials }.to change { flash[:alert] }.to "Invalid Email/Password combination"
      end

      it "re-renders the new form" do
        expect(login_with_invalid_credentials).to render_template(:new)
      end
    end
  end

  describe "GET destroy" do
    before :each do
      login_with_valid_credentials
    end

    it "clears the session" do
      expect(session).to receive(:clear)
      get :destroy
    end

    it "redirects to the sign in page" do
      expect( get :destroy).to redirect_to(sign_in_path)
    end

    it "sets flash notice to sucess message" do
      expect { get :destroy }.to change { flash[:notice] }.to("You have successfully signed out!")
    end
  end
end
