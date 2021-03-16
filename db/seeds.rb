password = 'pass123'
1.upto(5) do |i|
  User.create(
    username:"user-#{i}",
    email: "user-#{i}@example.com",
    password: password,
    password_confirmation: password
  )
end

