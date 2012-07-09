module Nesta
  module Plugin
    module DatePermalinks
      DATE_MATCH = /\d{4}\/\d{2}\/[\w-]+$/
      DATE_FORMAT = "%Y/%m"

      def self.resolve_path(path)
        segments = path.split('/')
        date_path = segments[-3..4]
        if date_path && date_path.join('/').match(DATE_MATCH)
          path = segments[0..-4].push(segments.last).join('/')
        end
        path
      end
    end
  end
end
