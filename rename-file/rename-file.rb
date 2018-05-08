Dir.chdir "./test-file"
Dir.glob("*.csv").each do |fileName|
    puts fileName
    File.rename(fileName, "test-file-after.csv")
end
Dir.glob("*.csv").each do |fileName|
    puts fileName
end

