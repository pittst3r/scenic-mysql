module Scenic
  module Adapters
    class Mysql
      # Decorates an ActiveRecord connection with methods that help determine
      # the connections capabilities.
      #
      # Every attempt is made to use the versions of these methods defined by
      # Rails where they are available and public before falling back to our own
      # implementations for older Rails versions.
      #
      # @api private
      class Connection < SimpleDelegator
        # True if the connection supports materialized views.
        #
        # Delegates to the method of the same name if it is already defined on
        # the connection. This is the case for Rails 4.2 or higher.
        #
        # @return [Boolean]
        def supports_materialized_views?
          false
        end
      end
    end
  end
end
