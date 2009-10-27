def authenticate(password)
  if 'pasword' == password then
    session["logged_in"] = true
    return true
  else
    return false
  end
end

def logout
  session["logged_in"] = false
end

def secure
  redirect '/' if not @is_admin
end
