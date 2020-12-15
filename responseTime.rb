require 'net/http'
require 'uri'

def responseTime(host)
  begin
    url = URI.parse(host)
    startTime = Time.now
    response = Net::HTTP.get(url)
    endTime = Time.now - startTime

    if endTime > 300
      puts "response time : #{endTime}"
    else
      puts "response time less than 5 minutes"
    end

  rescue Errno::ECONNREFUSED
    return false
  end
end

responseTime "https://gitlab.com"
