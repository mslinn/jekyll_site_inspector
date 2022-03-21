# frozen_string_literal: true

require "jekyll"
require "jekyll_plugin_logger"

module Jekyll
  PLUGIN_NAME = "site_inspector"

  class ContextInspector < Liquid::Tag
    def render(context)
      site = context.registers[:site]
      inspector_enabled = site.config["site_inspector"]
      return if inspector_enabled.nil? || !inspector_enabled

      mode = site.config["env"]["JEKYLL_ENV"]
      return unless inspector_enabled == "force" || mode == "development"

      dump_info(context)
    end

    private

    def dump_info(context)
      page = context.registers[:page]
      info do
        key_value_pairs = context.registers.map do |key, value|
          "  <code>#{key}</code> has a value with type <code>#{value.class}</code>"
        end
        vars = page.keys.sort.join("</code>, <code>")
        <<~END_MESSAGE
          context for #{page.path} is of type #{context.class}.
          context.registers for #{page.path} contains the following key/value pairs:
          #{key_value_pairs.join("\n")}
          #{PLUGIN_NAME}: #{page.path} contains the following key/value pairs:
          <p class='info'>Jekyll variables for this page are:
          <code>#{vars}</code></p>
        END_MESSAGE
      end
    end
  end

  Liquid::Template.register_tag(PLUGIN_NAME, ContextInspector)
  info { "Loaded #{PLUGIN_NAME} plugin." }
end
