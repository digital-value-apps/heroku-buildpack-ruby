require_relative '../spec_helper'

describe "Rails 6" do
  it "should detect successfully" do
    Hatchet::App.new('rails-jsbundling').in_directory_fork do
      expect(LanguagePack::Rails6.use?).to eq(false)
      expect(LanguagePack::Rails7.use?).to eq(true)
    end
  end

  it "works with jsbundling" do
    Hatchet::Runner.new("rails-jsbundling").tap do |app|
      app.deploy do
        expect(app.output).to include("yarn install")
        expect(app.output).to include("Asset precompilation completed")
      end
    end
  end
end
