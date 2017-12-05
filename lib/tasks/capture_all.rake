namespace :capture_all do
  desc "Create new capture for each url"
  task :get => :environment do
    puts "Get"
    @urls = Url.all
    @urls.each do |url|
      puts url.url
      puts url.capture
    end
  end
end
