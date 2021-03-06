require "rails_helper"

RSpec.describe "Items::Deletes", type: :request do
  include_examples "item token"

  describe "DELETE /bucketlists/:id/items/:id" do
    before do
      create :bucketlist
      @item = create :item
    end

    context "when bucketlist exists" do
      it "returns 200" do
        delete "/api/v1/bucketlists/1/items/1"
        expect(response).to have_http_status 200
        item = Item.find_by id: 1
        expect(item).to be_nil
      end
    end

    context "when bucketlist item does not exist" do
      it "returns a 404 error" do
        get "/api/v1/bucketlists/1/items/2"
        expect(response).to have_http_status 404
      end
    end
  end
end
