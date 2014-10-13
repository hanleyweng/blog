# Title: Asset path tag for Jekyll
# Author: Sam Rayner http://samrayner.com
# Description: Output a relative URL for assets based on the post or page
#
# Syntax {% asset_path [filename] %}
#
# Examples:
# {% asset_path kitten.png %} on post 2013-01-01-post-title
# {% asset_path pirate.mov %} on page page-title
#
# Output:
# /assets/posts/post-title/kitten.png
# /assets/page-title/pirate.mov
#

module Jekyll
  class AssetPathTag < Liquid::Tag
    @filename = nil

    def initialize(tag_name, markup, tokens)
      #strip leading and trailing quotes
      @filename = markup.strip.gsub(/^("|')|("|')$/, '')
      super
    end

    def render(context)
      if @filename.empty?
        return "Error processing input, expected syntax: {% asset_path [filename] %}"
      end

      path = ""
      page = context.environments.first["page"]

      path = page["path"]

      #strip filename
      path = File.dirname(path) if path =~ /\.\w+$/

      #fix double slashes
      "#{context.registers[:site].config['baseurl']}/#{path}/#{@filename}".gsub(/\/{2,}/, '/')
    end
  end
end

Liquid::Template.register_tag('asset_path', Jekyll::AssetPathTag)
