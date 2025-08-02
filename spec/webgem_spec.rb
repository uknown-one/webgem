require "spec_helper"
require "webgem"

RSpec.describe Webgem do
  it "renders basic components" do
    html = Webgem.render do
      component "div", class: "test" do
        component "span" do
          text "Hello"
        end
      end
    end
    expect(html).to include("<div class=\"test\">")
    expect(html).to include("<span >Hello</span>")
  end

  it "applies theme default" do
    theme = Webgem::Theme.default
    expect(theme[:colors][:primary]).to eq("#1d4ed8")
  end
end
