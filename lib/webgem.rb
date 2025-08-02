require "webgem/version"
require "webgem/cli"
require "webgem/component"
require "webgem/theme"
require "webgem/grid"
require "webgem/form_builder"
require "webgem/renderer"

module Webgem
  class Error < StandardError; end

  # Top-level entry: render a layout
  def self.render(&block)
    renderer = Renderer.new
    renderer.instance_eval(&block)
    renderer.to_html
  end
end
