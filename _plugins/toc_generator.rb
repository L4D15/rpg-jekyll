require "nokogiri"

class TableOfContentsGenrator < Jekyll::Generator
  def generate(site)
    parser = Jekyll::Converters::Markdown.new(site.config)

    #puts "Generating Table of contents:"

    campaign_collections = Jekyll.configuration({})['collections'].keys

    campaign_collections.each do |collection_name|
      if collection_name == "posts"
        #puts "  posts [IGNORED]"
      else
        #puts "  #{collection_name}"
        site.collections[collection_name].docs.each do |page|
          #puts "    #{page.data['title']}"
          content = page.content
          converted_content = parser.convert(content)
          doc = Nokogiri::HTML(converted_content)

          page.data['nav'] = doc.css('h1').map do |h1|
            to_nav_item(page, h1).tap do |item|
              item["children"] = subheadings(h1).map do |h2|
                to_nav_item(page, h2).tap do |subitem|
                  subitem['children'] = subsubheadings(h2).map { |h3| to_nav_item(page, h3)  }
                end
              end
            end
          end
        end
      end
    end
  end

  # Creates heading info for the metadata
  def to_nav_item(page, heading)
    {
      "title" => heading.text,
      "url" => [page.url, heading['id']].join("#")
    }
  end

  # Finds all H2 inside an H1
  def subheadings(el)
    Enumerator.new do |y|
      next_el = el.next_sibling
      while next_el && next_el.name != "h1"
        if next_el.name == "h2"
          y << next_el
        end
        next_el = next_el.next_sibling
      end
    end
  end

  # Finds all H3 inside an H2
  def subsubheadings(el)
    Enumerator.new do |y|
      next_el = el.next_sibling
      while next_el && next_el.name != "h2"
        if next_el.name == "h3"
          y << next_el
        end
        next_el = next_el.next_sibling
      end
    end
  end


end
