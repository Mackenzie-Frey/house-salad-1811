require 'rails_helper'

describe PropublicaService do
  it "exists" do
    service = PropublicaService.new

    expect(service).to be_a(PropublicaService)
  end

  context "instance methods" do
    it "gets members" do
      service = PropublicaService.new

      result = service.get_members("CO")

      expect(result).to be_a(Hash)
      expect(result).to have_key(:results)
    end
  end

  describe "members" do
    it "finds all CO members" do
      VCR.use_cassette("services/find_co_members") do
        members = PropublicaService.find_house_members("CO")
        member = members.first

        expect(members.count).to eq(7)
        expect(member[:name]).to eq("Diana DeGette")
        expect(member[:party]).to eq("D")
        expect(member[:district]).to eq("1")
      end
    end
  end
end
