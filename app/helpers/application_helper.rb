module ApplicationHelper

	def fix_url(url)
		return url if url.blank?

		if url.starts_with?('http://')
			return url
		else
			return 'http://' + url
		end
	end

end
