require './database.rb'
require 'open-uri'
require 'nokogiri'

class Article < ActiveRecord::Base
end

url = 'http://matome.naver.jp/'

charset = nil
html = open(url){|f|
  charset = f.charset
  f.read
}

doc = Nokogiri::HTML.parse(html, nil, charset)

chumoku = doc.css('div.MdTopMTMList01:nth-child(1) > ul:nth-child(2)')

chumoku.css('li.mdTopMTMList01Item').each{|matome|
  title = matome.css('h3.mdTopMTMList01ItemTtl > a').first[:title]
  view = matome.css('span.mdTopMTMList01PVCountNum').text.to_i
  author = matome.css('p.mdTopMTMList01UserName > a').text
  url = matome.css('h3.mdTopMTMList01ItemTtl > a').first[:href]
  line = {
    :title => title,
    :view => view,
    :author => author,
    :url => url
  }
  Article.create(line)
}
