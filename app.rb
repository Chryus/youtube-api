require 'bundler'
Bundler.require
require 'open-uri'

Dir.glob('./lib/*.rb') do |model|
  require model
end

module Name
  class App < Sinatra::Application

    #configure
    configure do
      set :root, File.dirname(__FILE__)
      set :public_folder, 'public'
    end

    # #database
    # set :database, "sqlite3:///database.db"

    #filters

    #routes
    get '/videotrends' do
      #debugger
      fetcher = TwitterFetcher.new.helpers.client
      @nyc_trends = fetcher.trends(2459115)
      #@nyc_trends = fetch.get_trends #trends[1].collect{|attr|attr[:name]}
      @trend = @nyc_trends.collect {|t| t.name}.sample.gsub(" ", "_") #TwitterFetcher::CLIENT.trends.attrs.flatten[1].sample[:name].gsub(" ", "_").gsub("\"", "")
      download = open("https://gdata.youtube.com/feeds/api/videos?q=#{@trend}")
      doc = Nokogiri::HTML(download.read)
      vids = doc.xpath('//link[contains(@href, "https://www.youtube.com/watch")]').to_a
      @video = vids.sample["href"][32..-23]
      haml :index
    end

    # @trends[1].collect{|attr|attr[:name]}

    get '/twitter' do
      @stuff = TwitterFetcher::CLIENT.trends.attrs.flatten[1].sample[:name]
      haml :twitter
    end

    #helpers
    helpers do
      def partial(file_name)
        erb file_name, :layout => false
      end
    end

  end
end
