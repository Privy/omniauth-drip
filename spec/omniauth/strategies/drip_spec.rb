require 'spec_helper'

describe OmniAuth::Strategies::Drip do

  subject do
    OmniAuth::Strategies::Drip.new({})
  end

  context "general" do
    it "should be called drip" do
      subject.options.name.should eq('drip')
    end
  end

  context "endpoints" do
    it "has correct site" do
      subject.options.client_options.site.should eq("https://api.getdrip.com")
    end

    it "has correct authorize_url" do
      subject.options.client_options.authorize_url.should eq("https://www.getdrip.com/oauth/authorize")
    end

    it "has correct token_url" do
      subject.options.client_options.token_url.should eq("https://www.getdrip.com/oauth/token")
    end
  end

end
