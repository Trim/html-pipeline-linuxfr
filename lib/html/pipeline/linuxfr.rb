module HTML
  class Pipeline

    class LinuxFr
      CONTEXT = {
        toc_minimal_length: 5000,
        toc_header: "<h2 class=\"sommaire\">Sommaire</h2>\n",
        host: "linuxfr.org"
      }

      def self.render(text)
        pipeline = HTML::Pipeline.new [
          HTML::Pipeline::MarkdownFilter,
          HTML::Pipeline::TableOfContentsFilter,
          HTML::Pipeline::SyntaxHighlightFilter,
          HTML::Pipeline::RelativeLinksFilter,
          HTML::Pipeline::CustomLinksFilter
        ], CONTEXT
        result = pipeline.call text
        result[:output].to_s
      end
    end

  end
end
