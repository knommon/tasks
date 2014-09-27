require 'spec_helper'

describe "User pages" do

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:m1) { FactoryGirl.create(:post, user: user, content: "Foo") }
    let!(:m2) { FactoryGirl.create(:post, user: user, content: "Bar") }

    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }

    describe "posts" do
      it { should have_content(m1.content) }
      it { should have_content(m2.content) }
      it { should have_content(user.posts.count) }
    end
  end
end
