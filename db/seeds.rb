# Create admin id=1(permanent)
Admin.create!(email: "admin@gmail.com",
              name: "AdminBot",
              password: "123123",
              address: "Admin page!",
              flag: true)

Member.create!(email: "member@gmail.com",
              name: "MemberBot",
              password: "123123",
              address: "Member page!")

50.times do |n|
  name = Faker::Name.name
  email = "admin#{n+1}@example.com"
  password = "123123"
  address= ["DaNang", "HaNoi", "SaiGon", "CanTho", "HaiPhong", "KhanhHoa"].sample
  Admin.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               address: address)
end

50.times do |n|
  name = Faker::Name.name
  email = "member#{n+1}@example.com"
  password = "123123"
  address= ["DaNang", "HaNoi", "SaiGon", "CanTho", "HaiPhong", "KhanhHoa"].sample
  Member.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               address: address)
end
