module Scenic
  module Adapters
    class Mysql
      # Fetches defined views from the postgres connection.
      # @api private
      class Views
        def initialize(connection)
          @connection = connection
        end

        # All of the views that this connection has defined.
        #
        # This will include materialized views if those are supported by the
        # connection.
        #
        # @return [Array<Scenic::View>]
        def all
          view_info.map(&method(:to_scenic_view))
        end

        private

        attr_reader :connection

        def view_info
          view_names_from_mysql.map do |(name, _type)|
            { name: name, definition: view_definition(name) }
          end
        end

        def view_names_from_mysql
          connection.execute(<<-SQL)
            SHOW FULL TABLES IN #{db_name} WHERE TABLE_TYPE LIKE 'VIEW';
          SQL
        end

        def view_definition(view_name)
          result = connection.execute(<<-SQL)
            SHOW CREATE VIEW #{view_name};
          SQL
          result.first.second
        end

        def to_scenic_view(result)
          Scenic::View.new(
            name: result[:name],
            definition: result[:definition].strip,
            materialized: false
          )
        end

        def db_name
          @db_name ||= ActiveRecord::Base.connection_config.fetch :database
        end
      end
    end
  end
end
