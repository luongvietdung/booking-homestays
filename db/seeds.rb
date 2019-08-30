# Create admin id=1(permanent)
Admin.create!(email: "admin@gmail.com",
              name: "AdminBot",
              password: "123123",
              address: "Admin page!",
              flag: true)

Member.create!(email: "member@gmail.com",
              name: "MemberBot",
              password: "123123",
              address: "Member page!",
              confirmed_at: Time.now)

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
               address: address,
               confirmed_at: Time.now)
end

["CĂN HỘ CHUNG CƯ","NHÀ RIÊNG", "CĂN HỘ STUDIO", "KHÁC", "BIỆT THỰ"].each do |favorite_space|
  FavoriteSpace.create! name: favorite_space
end
  
20.times do |price|
  price = rand(1..999999)
  Price.create!(cost: price,
                cleaning_fee: price)
end

20.times do |f|
  5.times do |n|
    name = Faker::Name.name
    address = Faker::Address.country
    Room.create!(name: name,
                  address: address,
                  guest: 1,
                  bed_room: rand(1..5),
                  bath_room: rand(1..5),
                  type_room: rand(0..1),
                  location_id: rand(1..4),
                  user_id: 1,
                  favorite_space_id: n+1,
                  price_id: rand(1..20))
  end
end
