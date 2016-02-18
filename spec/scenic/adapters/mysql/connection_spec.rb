require "spec_helper"

module Scenic
  module Adapters
    describe Mysql::Connection do
      subject { described_class.new double }

      describe "supports_materialized_views?" do
        it "returns false" do
          expect(subject.supports_materialized_views?).to be false
        end
      end
    end
  end
end
