module ApplicationHelper
    def control_group_tag(errors, &block)
        if errors.any?
            content_tag :div, capture(&block), class: 'control-group error'
        else
            content_tag :div, capture(&block), class: 'control-group'
        end
    end

    def markdown(text)
        renderer = Redcarpet::Render::HTML.new
        extensions = {fenced_code_blocks: true, gh_codeblocks: true, autolink: true, hard_wrap: true, filter_html: true, no_intraemphasis: true}

        redcarpet = Redcarpet::Markdown.new(renderer, extensions)
        syntax_highlighter((redcarpet.render text)).html_safe
    end

    def syntax_highlighter(html)
        doc = Nokogiri::HTML(html)
        doc.search("//pre[@lang]").each do |pre|
            pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
        end
        doc.to_s
    end
end
