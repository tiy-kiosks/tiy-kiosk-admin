User.where(username: "jwo").first_or_create do |t|
  t.password = "12345678"
end
