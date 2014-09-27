require 'spec_helper'
require 'rspec/its'

describe Task do

  let(:user) { FactoryGirl.create(:user) }
  before do
    @post = user.tasks.build(content: "Lorem ipsum")
  end

  subject { @post }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @post.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @post.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @post.content = "a" * 256 }
    it { should_not be_valid }
  end
end
