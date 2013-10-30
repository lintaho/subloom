require 'spec_helper'

describe "Pages" do

  describe "Home Page" do
    before { visit root_path }
    subject{ page }
    # let(:user) { FactoryGirl.create(:user) }
    it { should have_content('Add a link') }
  end


  describe "About" do
    before { visit about_path }
    subject{ page }
    it { should have_content('About') }

  end


  describe "Contact" do
    before { visit contact_path }
    subject { page }
    it { should have_content('Contact') }
  end


end
