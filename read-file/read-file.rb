require 'csv'

Encoding.default_external = 'UTF-8'

filename = './sample-read-text/sample-read-text.csv'
CSV.foreach(filename, headers: true) do |data|
    puts data
end
