#coding: UTF-8

module Jekyll

	# added accessor 'categories_links'
	class Site
		attr_accessor :config, :layouts, :posts, :pages, :static_files,
		              :categories, :categories_links, :exclude, :include, :source, :dest, :lsi, :pygments,
		              :permalink_style, :tags, :time, :future, :safe, :plugins, :limit_posts

		def read_posts(dir)
		  base = File.join(self.source, dir, '_posts')
		  return unless File.exists?(base)
		  entries = Dir.chdir(base) { filter_entries(Dir['**/*']) }

		  self.categories_links = Array.new

		  # first pass processes, but does not yet render post content
		  entries.each do |f|
		    if Post.valid?(f)
		      post = Post.new(self, self.source, dir, f)

		      if post.published && (self.future || post.date <= self.time)
		        self.posts << post
		        post.categories.each { |c|
		        	self.categories_links << catname2link(c) # => added this string
		        	self.categories[c] << post
		        }
		        post.tags.each { |c| self.tags[c] << post }
		      end
		    end
		  end

		  self.posts.sort!

		  # limit the posts if :limit_posts option is set
		  if limit_posts
		    limit = self.posts.length < limit_posts ? self.posts.length : limit_posts
		    self.posts = self.posts[-limit, limit]
		  end
		end

	end


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