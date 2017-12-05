5.times do |i|
  User.create(name: "u#{i}", email: "u#{i}@example.com", pass: "u#{i}")
end

Url.create(name: "tobata.asia", url:"tobata.asia", user_id: 1)
Url.create(name: "yahoo.co.jp", url:"yahoo.co.jp", user_id: 1)
Url.create(name: "google.com", url:"google.com", user_id: 2)
Url.create(name: "www.kyutech.ac.jp", url:"www.kyutech.ac.jp", user_id: 3)
