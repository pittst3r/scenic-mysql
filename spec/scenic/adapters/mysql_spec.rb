require "spec_helper"

module Scenic
  module Adapters
    describe Mysql, :db do
      describe "#create_view" do
        it "successfully creates a view" do
          adapter = described_class.new

          adapter.create_view("greetings", "SELECT 'hi' AS greeting")

          expect(adapter.views.map(&:name)).to include("greetings")

          ActiveRecord::Base.connection.execute <<-SQL
            DROP VIEW greetings
          SQL
        end
      end

      describe "#drop_view" do
        it "successfully drops a view" do
          adapter = described_class.new

          adapter.create_view("greetings", "SELECT 'hi' AS greeting")
          adapter.drop_view("greetings")

          expect(adapter.views.map(&:name)).not_to include("greetings")
        end
      end

      describe "#views" do
        it "returns the views defined on this connection" do
          adapter = described_class.new

          ActiveRecord::Base.connection.execute <<-SQL
            CREATE VIEW parents AS SELECT 'Joe' AS name
          SQL

          ActiveRecord::Base.connection.execute <<-SQL
            CREATE VIEW children AS SELECT 'Owen' AS name
          SQL

          ActiveRecord::Base.connection.execute <<-SQL
            CREATE VIEW people AS
            SELECT name FROM parents UNION SELECT name FROM children
          SQL

          ActiveRecord::Base.connection.execute <<-SQL
            CREATE VIEW people_with_names AS
            SELECT name FROM people
            WHERE name IS NOT NULL
          SQL

          expect(adapter.views.map(&:name)).to eq [
            "children",
            "parents",
            "people",
            "people_with_names",
          ]

          ActiveRecord::Base.connection.execute <<-SQL
            DROP VIEW parents, children, people, people_with_names
          SQL
        end
      end
    end
  end
end
