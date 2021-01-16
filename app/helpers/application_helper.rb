module ApplicationHelper

def if_user_logged_in
   if user_signed_in?
   	(link_to 'Log Out', destroy_user_session_path, method: :delete, data: { confirm: 'Are You Sure?' }, class:'btn pink') +
   	(link_to current_user.name, user_path(current_user), class:'btn pink')
   else
   	( link_to 'Log In', new_user_session_path, class:'btn pink mx-3') +
   	(link_to 'Sign Up', new_user_registration_path, class:'btn pink')
   end
end
end
