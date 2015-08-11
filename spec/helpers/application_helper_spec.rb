require "rails_helper"

describe ApplicationHelper do

  describe "#flash_class" do
    context "level is notice" do
      it "returns alert alert-warning" do
        expect(flash_class(:notice)).to eq "alert alert-warning"
      end
    end
    context "level is success" do
      it "returns alert alert-success" do
        expect(flash_class(:success)).to eq "alert alert-success"
      end
    end
    context "level is error" do
      it "returns alert alert-error" do
        expect(flash_class(:error)).to eq "alert alert-error"
      end
    end
  end

end
