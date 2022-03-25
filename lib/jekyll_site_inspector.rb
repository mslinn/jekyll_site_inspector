# frozen_string_literal: true

require "jekyll"
require "jekyll_plugin_logger"
require_relative "jekyll_site_inspector/version"

module JekyllPluginNameSiteInspector
  PLUGIN_NAME = "site_inspector"
end

module Jekyll
  class SiteInspector < Jekyll::Generator
    # Displays information about the Jekyll site
    # @param site [Jekyll.Site] Automatically provided by Jekyll plugin mechanism
    # @return [void]
    def generate(site) # rubocop:disable Metrics/AbcSize, Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
      @logger = PluginMetaLogger.instance.new_logger(self)

      mode = site.config["env"]["JEKYLL_ENV"]

      config = site.config["site_inspector"]
      return if config.nil?

      inspector_enabled = config != false
      return unless inspector_enabled

      force = config == "force"
      return unless force || mode == "development"

      @logger.info { "site is of type #{site.class}" }
      @logger.info { "site.time = #{site.time}" }
      @logger.info { "site.config['env']['JEKYLL_ENV'] = #{mode}" }
      site.collections.each do |key, _|
        @logger.info { "site.collections.#{key}" }
      end

      # key env contains all environment variables, quite verbose so output is suppressed
      site.config.sort.each { |key, value| @logger.info { "site.config.#{key} = '#{value}'" unless key == "env" } }

      site.data.sort.each { |key, value| @logger.info { "site.data.#{key} = '#{value}'" } }
      # site.documents.each {|key, value| @log.info "site.documents.#{key}" } # Generates too much output!
      @logger.info { "site.keep_files: #{site.keep_files.sort}" }
      # site.pages.each {|key, value| @log.info "site.pages.#{key}"" } # Generates too much output!
      # site.posts.each {|key, value| @log.info "site.posts.#{key}" }  # Generates too much output!
      site.tags.sort.each { |key, value| @logger.info { "site.tags.#{key} = '#{value}'" } }
    end
  end
end

PluginMetaLogger.instance.info { "Loaded #{JekyllPluginNameSiteInspector::PLUGIN_NAME} v#{JekyllSiteInspector::VERSION} plugin." }
