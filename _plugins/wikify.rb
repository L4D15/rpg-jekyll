# Converts any sequence of words that matchs a page title in the site into a link to that page 

Jekyll::Hooks.register :documents, :pre_render do |page, payload|
	site = Jekyll.sites.first
	docExt = page.extname.tr('.','')

	# Process only markdown files
	if payload['site']['markdown_ext'].include? docExt
		site.collections.each do |collection|
			collection[1].docs.each do |colPage|
				title = colPage.data['title']
				url = colPage.url
				regularExpression = /(?<![\[\/])#{title}/
				markdownLink = "[#{title}](#{url})"

				wikifiedContent = page.content.gsub(regularExpression, markdownLink)
				page.content = wikifiedContent;
			end
		end
	end
end