module TracksHelper
	def ugly_lyrics(lyrics)
		html = <<-HTML 
			<pre>
				#{lyrics}
			</pre>
		HTML

		html.html_safe
	end
end
