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

  def fetch_meetups
      json = open("https://api.meetup.com/2/events?&sign=true&photo-host=public&venue_id=23753432&page=20&key=326e493f58383976434f5963243a5e&callback=?").read
      JSON.parse(json, object_class: OpenStruct)["results"]
  end

  def all_meetups
    @all_meetups ||= fetch_meetups
  end

  def meetups_this_week
    all_meetups.select {|t| t["time"] >= Time.now.beginning_of_week(start_day = :sunday).to_i*1000 && Time.now.end_of_week(end_day = :saturday).to_i*1000 >= t["time"] }
  end

  def fetch_meetups_worth_going
    json = open("https://api.meetup.com/2/events?member_id=100501792&offset=0&format=json&limited_events=False&photo-host=public&page=20&fields=&order=time&desc=false&status=upcoming&sig_id=100501792&sig=a16f1f16f21e97938877eb5d4bb2a1399739a0bb").read
    JSON.parse(json, object_class: OpenStruct)["results"]
  end

  def all_meetups_worth_going
    @meetups_worth ||= fetch_meetups_worth_going
  end

  def meetups_worth_this_week
    all_meetups_worth_going.select {|t| t["time"] >= Time.now.beginning_of_week(start_day = :sunday).to_i*1000 && Time.now.end_of_week(end_day = :sunday).to_i*1000 >= t["time"] }
  end

  def fetch_announcements
    json = open("https://tiyspeakers.herokuapp.com/api/v1/announcements").read
    JSON.parse(json, object_class: OpenStruct)["announcements"]
  end

  def all_announcements
    @all_announcements ||= fetch_announcements
  end

  def this_week_announcements
    all_announcements.select {|t| t["date"] >= Time.now.beginning_of_week(start_day = :sunday) && Time.now.end_of_week(end_day = :saturday) >= t["date"] }
  end

  def fetch_fun_facts
      json = open("https://tiyfunfactz.herokuapp.com/students.json").read
      JSON.parse(json, object_class: OpenStruct)["students"]
  end

  def all_fun_facts
    @all_fun_facts ||= fetch_fun_facts
  end

  def sample_fun_facts
    all_fun_facts.sample(5)
  end


end
