require("spec_helper")
RSpec.describe(Hashtag) do
  it("should not save without setting the hashtag") do
    hashtag = Hashtag.new
    expect((not hashtag.save)).to(be_truthy)
  end
  it("should reject abc as a hastag") do
    hashtag = Hashtag.new
    hashtag.hashtag = "abc"
    expect((not hashtag.valid?)).to(be_truthy)
  end
  it("should accept #pokemon as a hashtag") do
    hashtag = Hashtag.new
    hashtag.hashtag = "#pokemon"
    expect(hashtag.valid?).to(eq(true))
  end
  it("should not save the same hashtag twice") do
    hashtag1 = Hashtag.new
    hashtag1.hashtag = "#pokemon"
    hashtag1.save
    hashtag2 = Hashtag.new
    hashtag2.hashtag = "#pokemon"
    expect((not hashtag2.save)).to(be_truthy)
  end
end
