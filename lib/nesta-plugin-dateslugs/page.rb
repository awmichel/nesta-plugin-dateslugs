module Nesta
  class Page
    def article?
      self.metadata('date') != nil
    end

    def permalink
      if self.article?
        date_slug = DateTime.parse(metadata('date')).strftime(Nesta::Plugin::DatePermalinks::DATE_FORMAT)
        File.join(File.dirname(self.abspath), "#{date_slug}/#{super}")
      else
        self.abspath
      end
    end
  end
end
