require './spec/rails_helper.rb'

RSpec.describe "PagesController", type: :request do
    describe "index page is functionnal" do
        it "render the index page" do
            get "/"
            expect(response.status).to render_template(:index)
        end
        it "complete request" do
            get "/"
            expect(response.status).to eq(200)
        end
    end
    describe "residential page is functionnal" do
        it "render the residential page" do
            get "/pages/residential"
            expect(response.status).to render_template(:residential)
        end
        it "complete request" do
            get "/pages/residential"
            expect(response.status).to eq(200)
        end
    end
    describe "commercial page is functionnal" do
        it "render the commercial page" do
            get "/pages/commercial"
            expect(response.status).to render_template(:commercial)
        end
        it "complete request" do
            get "/pages/commercial"
            expect(response.status).to eq(200)
        end
    end
    describe "quote page is functionnal" do
        it "render the quote page" do
            get "/pages/quote"
            expect(response.status).to render_template(:quote)
        end
        it "complete request" do
            get "/pages/quote"
            expect(response.status).to eq(200)
        end
    end
    describe "admin_stats is protected" do
        it "redirect to sign in" do
            get "/pages/admin_stats"
            expect(response).to redirect_to('/users/sign_in')
        end
    end
    describe "intervention is protected" do
        it "redirect to sign in" do
            get "/pages/intervention"
            expect(response).to redirect_to('/users/sign_in')
        end
    end
    describe "admin is protected" do
        it "redirect to index" do
            get "/admin"
            expect(response).to redirect_to('/')
        end
    end
    describe "stat is protected" do
        it "redirect to sign in" do
            get "/pages/charts"
            expect(response).to redirect_to('/users/sign_in')
        end
    end
end