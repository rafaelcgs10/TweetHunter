require("spec_helper")
RSpec.describe(Tweet) do
  it("should not save the same tweet twice") do
    tweet1 = Tweet.new
    tweet1.tweet_id = "123456"
    tweet1.save
    tweet2 = Tweet.new
    tweet2.tweet_id = "123456"
    expect((not tweet2.save)).to(be_truthy)
  end
end
