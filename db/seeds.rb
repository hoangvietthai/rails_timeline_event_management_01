user1 = User.create!(email: "dang.nhu.thuy@framgia.com",
  password: "123456",
  password_confirmation: "123456",
  role: 0,
  confirmation_token: nil,
  confirmation_sent_at: Time.now,
  confirmed_at: Time.now)
user2 = User.create!(email: "20144373@student.hust.edu.vn",
  password: "123456",
  password_confirmation: "123456",
  role: 2,
  confirmation_token: nil,
  confirmation_sent_at: Time.now,
  confirmed_at: Time.now)

50.times do |n|
  email = "example-#{n+1}@railstutorial.org"
  password = "123456"
  User.create! email: email, password: password,
    password_confirmation: password,
    role: 2,
    confirmation_token: nil,
    confirmation_sent_at: Time.now,
    confirmed_at: Time.now
  end
  
event1 = Event.create!(place: "Ha Noi", time_from: Time.now - 1, time_to: Time.now,
  remind: true, importance: "normal", description: "day la dai tieng noi VN")
Notification.create!(notify_before: Time.now, event_id: event1.id)
UserEvent.create!(event_id: event1.id, user_id: user1.id)
UserEvent.create!(event_id: event1.id, user_id: user2.id, permission:  0)

event2 = Event.create!(place: "Hai Phong", time_from: Time.now - 1, time_to: Time.now,
  remind: true, importance: "normal", description: "Phat thanh tu ha noi")
Notification.create!(notify_before: Time.now, event_id: event2.id)
UserEvent.create!(event_id: event2.id, user_id: user1.id)
UserEvent.create!(event_id: event2.id, user_id: user2.id, permission:  0)


50.times do |n|
  event1 = Event.create!(place: "Ha Noi", time_from: Time.now - 1, time_to: Time.now,
    remind: true, importance: "normal", description: "day la dai tieng noi VN")
  Notification.create!(notify_before: Time.now, event_id: event1.id)
  UserEvent.create!(event_id: event1.id, user_id: user1.id)
  UserEvent.create!(event_id: event1.id, user_id: user2.id, permission:  0)
  end
