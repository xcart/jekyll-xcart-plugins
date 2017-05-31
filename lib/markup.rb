# encoding: utf-8

# Jekyll plugin for maintaining links and referencis.
# adds {% note %} and {% tab %} + {% tabs %} tags
#
# Author: Eugene Dementjev
# Version: 0.2.2

module JekyllXcart
  module MarkupPlugin

    class NoteTag < Liquid::Block
      def initialize(tag_name, args, tokens)
        super
        @type = args.strip
      end

      def render(context)
        content = super

        color = case @type
            when 'warning' then 'yellow'
            when 'danger' then 'red'
            when 'info' then 'blue'
            when 'success' then 'green'
            else ''
        end

        return <<-HTML
<div class="ui padded #{color} segment note" markdown="1">#{content}</div>
HTML
      end
    end
    
    class << self; attr_accessor :tabs, :current_index, :tab_autoincrement; end

    self.tabs = Array.new
    self.current_index = 0
    self.tab_autoincrement = 0

    class TabTag < Liquid::Block
      def initialize(tag_name, args, tokens)
        super
        @heading = args.strip
        @tabindex = 'tab-' + JekyllXcart::MarkupPlugin.tab_autoincrement.to_s
        JekyllXcart::MarkupPlugin.tab_autoincrement = JekyllXcart::MarkupPlugin.tab_autoincrement + 1
        JekyllXcart::MarkupPlugin.tabs << { :title => @heading, :index => @tabindex }
      end

      def render(context)
        return "" if @heading.empty?

        site      = context.registers[:site]

        content = super
        first_char = content.index(/\S/m)
        leading_space = content.slice(0, first_char)
        content.strip!
        # content = converter.convert(content)

        return <<-HTML
#{leading_space}<div data-tab="#{@tabindex}" class="ui bottom attached tab segment" markdown="span">
#{content}
</div>
HTML
      end
    end

    class TabsTag < Liquid::Block

      def initialize(tag_name, args, tokens)
        super
        JekyllXcart::MarkupPlugin.tabs = Array.new
      end
      def render(context)
        content = super

        tabitems = JekyllXcart::MarkupPlugin.tabs.map { |tab|
          "<a class='item' data-tab='#{tab[:index]}'>#{tab[:title]}</a>"
        }.join


        markup = <<-HTML
<div class="ui top attached tabular menu">#{tabitems}</div>
#{content}
HTML

        markup.each_line {|s| puts s}

        return markup
      end
    end

  end
end

Liquid::Template.register_tag('note', JekyllXcart::MarkupPlugin::NoteTag)
Liquid::Template.register_tag('tab', JekyllXcart::MarkupPlugin::TabTag)
Liquid::Template.register_tag('tabs', JekyllXcart::MarkupPlugin::TabsTag)