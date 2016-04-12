require 'open-uri'
require 'json'
require 'ostruct'

module ApplicationHelper

  def comic_url
    url = 'http://www.commitstrip.com/en/'
    agent = Mechanize.new
    page = agent.get(url)

    detail_page = agent.click page.at(".excerpts .excerpt a")
    detail_page.at(".entry-content img")['src']
  end

  def fetch_speakers
    json = open("https://tiyspeakers.herokuapp.com/api/v1/speakers").read
    JSON.parse(json, object_class: OpenStruct)["speakers"]
  end


  def all_speakers
    @all_speakers ||= fetch_speakers
  end

  def this_weeks_speakers

    all_speakers.select do |t|
      talk_date = t["date"] || "3000-02-02".to_date.strftime('%m/%d/%Y')
      talk_date >= Time.now.beginning_of_week(start_day = :sunday).strftime('%m/%d/%Y') && Time.now.end_of_week(end_day = :saturday).strftime('%m/%d/%Y') >= talk_date
    end.sort_by {|date| date.date}
  end

end
