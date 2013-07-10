# encoding: utf-8
module Jekyll
  class StickerListTag < Liquid::Tag
    def render(context)
      html = ""
      source = context.registers[:site].source
      stickers_dir = "#{source}/images/stickers"
      stickers = Dir.entries(stickers_dir).select {|f| !File.directory? f}
      stickers.sort.each do |sticker|
        url_part_name = sticker.split(".")[0..-2]
        if url_part_name.size >= 2
          url_to = "http://#{url_part_name.join('.')}"
          html << "<a href='#{url_to}'><img style='padding: .5em; margin: .5em;' src='/images/stickers/#{sticker}'></a>"
        else
          html << "<img style='padding: .5em; margin: .5em;' src='/images/stickers/#{sticker}' >"
        end
      end
      html
    end
  end
end

Liquid::Template.register_tag('stickers', Jekyll::StickerListTag)