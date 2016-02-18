require "spec_helper"

module Scenic
  module Adapters
    describe Mysql::Views, :db do
      it "returns scenic view objects for plain old views" do
        connection = ActiveRecord::Base.connection
        connection.execute <<-SQL
          CREATE VIEW children AS SELECT 'Elliot' AS name
        SQL

        views = described_class.new(connection).all
        first = views.first

        expect(views.size).to eq 1
        expect(first.name).to eq "children"
        expect(first.materialized).to be false
        expect(first.definition).to match /select 'Elliot' AS `name`/

        connection.execute <<-SQL
          DROP VIEW children
        SQL
      end
    end
  end
end
