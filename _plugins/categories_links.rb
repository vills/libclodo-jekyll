#coding: UTF-8
module Jekyll


	class Post
		def catname2link(category)
			require "#{self.site.source}/_catlinks"
			
			t = category_links.invert.key(category)
			return category if t.nil?
			t
		end


		# redefine standart jekyll's function
		def url
		  return @url if @url

		  url = if permalink
		    permalink
		  else

		  	# Change category name to it's link
		  	cats = Array.new
		  	categories.each { |c| cats << catname2link(c) } #.map { |c| URI.escape(c) }.join('/')

		    {
		      "year"       => date.strftime("%Y"),
		      "month"      => date.strftime("%m"),
		      "day"        => date.strftime("%d"),
		      "title"      => CGI.escape(slug),
		      "i_day"      => date.strftime("%d").to_i.to_s,
		      "i_month"    => date.strftime("%m").to_i.to_s,
		      # "categories" => categories.map { |c| URI.escape(c) }.join('/'),
		      "categories" => cats.map { |c| URI.escape(c) }.join('/'),
		      "output_ext" => self.output_ext
		    }.inject(template) { |result, token|
		      result.gsub(/:#{Regexp.escape token.first}/, token.last)
		    }.gsub(/\/\//, "/")
		  end

		  # sanitize url
		  @url = url.split('/').reject{ |part| part =~ /^\.+$/ }.join('/')
		  @url += "/" if url =~ /\/$/
		  @url
		end

	end

end