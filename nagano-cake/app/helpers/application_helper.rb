module ApplicationHelper
	def if_is_active(obj)
		yuukou = "有効"
		mukou = "無効"
		if true == obj.is_active
			yuukou
		else
			mukou
		end
	end
end
