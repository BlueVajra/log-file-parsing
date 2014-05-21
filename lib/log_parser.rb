class LogParser
  attr_accessor :logs

  def initialize(logs)
    @logs = parse_logs(logs)
  end

  def count
    logs.count
  end

  def dates
    logs.map do |log|
      log[:date]
    end
  end

  def log_chars
    logs.map do |log|
      log[:log_level_char]
    end
  end

  def parse_logs(logs_to_parse)
    log_array = logs_to_parse.split("\n")
    #[log level char], [<date> #<processid>]  <log level> -- : <message>
    #W, [2014-05-10T13:49:19.049260 #83516]  WARN -- : deliver B2C systems
    log_hashes = []
    log_array.each do |log|
      log_hash = {}
      log_hash[:log_level_char] = log.slice!(/^[A-Z]/)
      puts log

      log_hashes << log_hash
    end

    log_hashes
  end
end