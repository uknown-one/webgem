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


