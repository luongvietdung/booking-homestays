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

["Hà Nội", "Ninh Bình", "Thái Nguyên", "Quảng Bình", "Huế", "Đà Nẵng", "Bình Định", "Nha Trang", "TP. Hồ Chí Minh", "Đà Lạt"].each do |location|
  Location.create! name: location
end

["Đống Đa", "Ba Đình", "Cố Đô", "Hoàn Thành Thăng Long", "Cửa Tùng", "Sơn Trà", "Ngũ Hành Sơn", "Quận 1", "Quận 12", "Lăng Cô", "Quận 3", "Cẩm Lệ"].each do |area|
  Area.create! name: area, location_id: Location.all.sample.id
end

["CĂN HỘ CHUNG CƯ","NHÀ RIÊNG", "CĂN HỘ STUDIO", "KHÁC", "BIỆT THỰ"].each do |favorite_space|
  FavoriteSpace.create! name: favorite_space
end

20.times do |price|
  price = rand(1..999999)
  Price.create!(cost: price,
                cleaning_fee: price)
end

100.times do |n|
  name = Faker::Company.name.upcase
  area_id = Area.all.sample.id
  location_id = Area.find(area_id).location_id
  user_id = User.all.sample.id
  favorite_space_id = FavoriteSpace.all.sample.id
  address = Area.all.sample.name
  description = Faker::Lorem.sentence
  guest = rand(1..10)
  acreage = 100
  bed_room = rand(1..15)
  bath_room = rand(1..6)
  price = Price.all.sample.id
  Room.create!(name: name,
    user_id: user_id,
    area_id: area_id,
    location_id: location_id,
    favorite_space_id: favorite_space_id,
    address: address,
    description: description,
    guest: guest,
    acreage: acreage,
    bed_room: bed_room,
    bath_room: bath_room,
    price_id: price)
end

["Wifi","May Giat", "Tu Lanh", "Ho Boi", "Dieu Hoa"].each do |utility|
  Utility.create! name: utility
end

10.times do |voucher|
  Voucher.create!(code: SecureRandom.base64(10), sale: rand(1..100), date_off: 3.days.from_now)
end

20.times do |f|
  name = Faker::Name.name
  phone_booking = Faker::PhoneNumber.cell_phone
  request = Faker::Lorem.paragraph_by_chars
  email = "booking_test#{f+1}@example.com"
  Booking.create!(room_id: rand(1..50),
                  number_guest: rand(1..10),
                  checkin: Time.now,
                  checkout: 3.days.from_now,
                  status: 0,
                  email_booking: email,
                  name_booking: name,
                  phone_booking: phone_booking,
                  request: request,
                  voucher_id: rand(1..10))
end
