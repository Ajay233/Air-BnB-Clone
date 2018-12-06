def check_user(user)
  expect(user.id).to eq('1')
  expect(user.name).to eq('Name1')
  expect(user.username).to eq('Username')
  expect(user.email).to eq('email@email.com')
end

def check_space(space)
  expect(space.id).to eq('1')
  expect(space.name).to eq('Flat1')
  expect(space.description).to eq('1-bedroom flat')
  expect(space.date_available).to eq('2019-01-01')
  expect(space.booked).to eq('f')
  expect(space.owner_id).to eq('1')
  expect(space.price).to eq('100')
end
