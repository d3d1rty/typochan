# encoding: UTF-8

xml.instruct! :xml, version: '1.0'
xml.rss version: '2.0' do
  xml.channel do
    xml.title "#{@board.name} feed | #{ENV['CHAN_NAME']}"
    xml.author "Users of #{ENV['CHAN_NAME']}"
    xml.description @board.description
    xml.link board_url(@board)
    xml.language 'en'

    @posts.each do |post|
      xml.item do
        xml.title post.subject
        xml.author post.poster
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link board_post_url(@board, post)
        xml.guid post.id
        post.body
      end
    end
  end
end
