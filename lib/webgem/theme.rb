module Webgem
  class Theme
    DEFAULTS = {
      colors: {
        primary: "#1d4ed8",
        secondary: "#9333ea",
        background: "#f9fafb",
        text: "#1f2937"
      },
      spacing: {
        small: "4px",
        medium: "8px",
        large: "16px"
      },
      border_radius: "8px",
      font_stack: "system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen"
    }

    attr_reader :settings

    def initialize(overrides = {})
      @settings = deep_merge(DEFAULTS, symbolize_keys(overrides))
    end

    def [](key)
      @settings[key]
    end

    def self.default
      @default ||= Theme.new
    end

    def self.load(name)
      # placeholder: in real gem, load from config file; here we just support "dark" preset
      case name.to_s
      when "dark"
        Theme.new(
          colors: {
            background: "#1f2937",
            text: "#f3f4f6",
            primary: "#6366f1"
          }
        )
      else
        Theme.default
      end
    end

    private

    def symbolize_keys(obj)
      case obj
      when Hash
        obj.each_with_object({}) do |(k, v), h|
          h[k.to_sym] = symbolize_keys(v)
        end
      else
        obj
      end
    end

    def deep_merge(a, b)
      merger = proc { |key, v1, v2|
        if v1.is_a?(Hash) && v2.is_a?(Hash)
          v1.merge(v2, &merger)
        else
          v2
        end
      }
      a.merge(b, &merger)
    end
  end
end
