require 'spec_helper'
require 'log_parser'

describe LogParser do
  before :each do
    @logs = <<LOGS
W, [2014-05-10T13:49:19.049260 #83516]  WARN -- : deliver B2C systems
Z, [2014-05-10T13:49:19.049408 #83516]  WARN -- : transition sticky bandwidth
LOGS
  end
  it "counts the logs" do

    log_hash = LogParser.new(@logs)
    actual = log_hash.count
    expected = 2

    expect(actual).to eq expected

  end
  it "parses the logs and gets log_chars" do
    #[log level char], [<date> #<processid>]  <log level> -- : <message>
    log_hash = LogParser.new(@logs)
    actual = log_hash.log_chars
    expected = ["W","Z"]

    expect(actual).to eq expected

  end
  it "parses the logs and gets dates" do
    #[log level char], [<date> #<processid>]  <log level> -- : <message>
    log_hash = LogParser.new(@logs)
    actual = log_hash.dates
    expected = ["2014-05-10T13:49:19.049260","2014-05-10T13:49:19.049408"]

    expect(actual).to eq expected

  end


end