def check_todo(string)
    fail "Not a valid text" if string.empty?
    string.match(/(#TODO)/) ? true : false
end