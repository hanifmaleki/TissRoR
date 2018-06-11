module PersonHelper

  def getFullTitle(item)
    pref = item["prefixTitle"] || ""
    post = item["postfixTitle"] || ""
    firstname = item["firstname"] || ""
    lastname = item["lastname"] || ""
    fullname = "#{pref} #{firstname} #{lastname} #{post}"
  end

end
