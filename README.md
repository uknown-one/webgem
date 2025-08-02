# WebGem

Ruby-native web design toolkit and DSL for building components, responsive layouts, theming, and forms.

## Installation

```bash
gem build webgem.gemspec
gem install ./webgem-0.1.0.gem
```
# Basic Usage

```Ruby
require "webgem"

html = Webgem.render do
  theme "dark"

  component "h1" do
    text "Hello from WebGem"
  end
end

puts html
```

# Example Usage 

```ruby
require "webgem"

html = Webgem.render do
  theme "dark"

  component "header", class: "site-header" do
    component "h1" do
      text "My Site"
    end
    component "p" do
      text "Built with WebGem"
    end
  end

  grid(columns: 3) do
    component "div", class: "card" do
      component "h2" do
        text "Feature 1"
      end
      component "p" do
        text "Detail about feature one."
      end
    end

    component "div", class: "card" do
      component "h2" do
        text "Feature 2"
      end
      component "p" do
        text "Detail about feature two."
      end
    end

    component "div", class: "card" do
      component "h2" do
        text "Feature 3"
      end
      component "p" do
        text "Detail about feature three."
      end
    end
  end

  form(action: "/signup") do
    component "input", { name: "email", type: "email", placeholder: "you@example.com" }
    component "button", { type: "submit" } do
      text "Sign up"
    end
  end
end

puts html


