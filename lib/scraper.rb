require 'open-uri'
require 'pry'


class Scraper

@@students = []
  def self.scrape_index_page(index_url)
    html = open(index_url)
    doc = Nokogiri::HTML(html)
    doc.css("div.student-card").each do |student_card|
      student = {
        name: student_card.css("h4").text,
        location: student_card.css("p").text,
        profile_url: student_card.css("a[href]").first['href']
      }
      @@students << student
    end
    @@students
  end

  def self.scrape_profile_page(profile_url)
    html = open(profile_url)
    doc = Nokogiri::HTML(html)
    # student_file = {
    #   linkedin:,
    #   github: doc.css("div.social-icon-container a").first['href'],
    #   blog:,
    #   profile_quote:,
    #   bio:
    # }
  end

end
