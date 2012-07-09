module Nesta
  class App
    before do
      params[:splat] = [ Nesta::Plugin::DatePermalinks.resolve_path(request.path) ]
    end
  end
end
