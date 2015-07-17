module TracksHelper
	include ERB::Util

	def ugly_lyrics(lyrics)
		lines = lyrics.split("\r\n")
		lines.map! { |line| "&#9835; #{line}" }
		full_lyrics = lines.join("\r\n")
		
		html = <<-HTML 
			<pre>#{full_lyrics}</pre>
		HTML

		html.html_safe
	end
end
