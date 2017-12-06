class Url < ApplicationRecord
    belongs_to :user
    has_many :captures, :dependent => :destroy

    def first
        return self.captures.first
    end
    def last
        return self.captures.last
    end

    def capture
        require "open-uri"
        if (!self.url.nil? && self.url.length > 2) then
            @imgurl = open("https://cutycapt.tobata.asia/link.php?url=http://"+self.url).read
            #print @imgurl
            @c = Capture.create(name: self.url , imgurl: @imgurl, url: self)
            self.captures << @c    # これで、CaptureをUrlに登録！
            return @imgurl
        end
    end
end
