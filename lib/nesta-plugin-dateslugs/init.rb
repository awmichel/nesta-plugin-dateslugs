module Nesta
  module Plugin
    module Dateslugs
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

  class App
    before do
      params[:splat] = [ Nesta::Plugin::Dateslugs.resolve_path(request.path) ]
    end
  end

  class Page
    def article?
      self.metadata('date') != nil
    end

    def permalink
      if self.article?
        date_slug = DateTime.parse(metadata('date')).strftime(Nesta::Plugin::Dateslugs::DATE_FORMAT)
        File.join(File.dirname(self.abspath), "#{date_slug}/#{super}")
      else
        self.abspath
      end
    end
  end
end
