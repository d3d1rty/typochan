##
# = ApplicationHelper
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# Collection of helper methods to use across the application.
module ApplicationHelper
  ##
  # Transforms content provided in markdown syntax into HTML
  def markdown(content)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true,
                                                                   space_after_headers: true,
                                                                   fenced_code_blocks: true,
                                                                   underline: true,
                                                                   highlight: true,
                                                                   footnotes: true,
                                                                   tables: true)
    @markdown.render content
  end
end
