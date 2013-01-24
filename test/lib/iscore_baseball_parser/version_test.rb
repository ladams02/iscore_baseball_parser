require_relative '../../test_helper'

describe IscoreBaseballParser do
  it "must be defined" do
    IscoreBaseballParser::VERSION.wont_be_nil
  end
end