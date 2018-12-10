##
# = ApplicationHelper
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# Collection of helper methods to use across the application.
module ApplicationHelper
  ##
  # = MarkdownPreprocessor
  # Author::    Richard Davis
  # Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
  # License::   GNU Public License 3
  #
  # Creates a new renderer to allow syntax highlighting.
  class MarkdownPreprocessor < Redcarpet::Render::HTML
    def block_quote(quote)
      new_quote = []
      quote.lines.to_a.each_with_index do |line, index|
        if line.starts_with?('<p>')
          new_quote.push(line.insert(3, '>'))
        else
          new_quote.push(line.insert(0, '>'))
        end
      end
      %(<blockquote>#{new_quote.join('')}</blockquote>)
    end
  end

  ##
  # Transforms content provided in markdown syntax into HTML
  def markdown(content)
    preprocessor = MarkdownPreprocessor.new(filter_html: true, no_images: true, no_styles: true, hard_wrap: true)
    @markdown ||= Redcarpet::Markdown.new(preprocessor, autolink: true,
                                                       space_after_headers: true,
                                                       fenced_code_blocks: true,
                                                       underline: true,
                                                       highlight: true,
                                                       footnotes: true,
                                                       tables: true)
    @markdown.render(content).html_safe
  end
end
