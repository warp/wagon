module Locomotive
  module Wagon
    module Liquid
      module Drops
        class Page < Base

          delegate :title, :slug, :fullpath, :parent, :depth, :seo_title, :redirect_url, :meta_description, :meta_keywords,
                   :templatized?, :published?, :redirect?, :listed?, :handle, to: :@_source

          def children
            _children = @_source.children || []
            _children = _children.sort { |a, b| a.position.to_i <=> b.position.to_i }
            @children ||= liquify(*_children)
          end

          def content_type
            ProxyCollection.new(@_source.content_type) if @_source.content_type
          end

          def breadcrumbs
            # TODO
            ''
          end
        end
      end
    end
  end
end