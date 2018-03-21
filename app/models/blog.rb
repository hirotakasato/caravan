class Blog < ApplicationRecord
	attachment :blog_image
	# refileでは、定義したカラム名から_idを抜いたものをattachmentというメソッドに定義する
	# 以降、blog_imageというカラムとして扱っていく
end
