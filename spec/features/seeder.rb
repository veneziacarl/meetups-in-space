module Seeder

  def seed_db
    User.create({provider: 'fromCarl', uid: 'fdskfjkla', username: 'king', email: 'bobloblaw@google.com', avatar_url: 'http://i2.cdn.turner.com/cnnnext/dam/assets/111017060721-giant-panda-bamboo-story-top.jpg'})
    User.create({provider: 'fromCarl', uid: 'fsdfasda', username: 'queen', email: 'bob@google.com', avatar_url: 'http://i2.cdn.turner.com/cnnnext/dam/assets/111017060721-giant-panda-bamboo-story-top.jpg'})
    User.create({provider: 'fromCarl', uid: 'qweqwea', username: 'beefsteak', email: 'blaw@google.com', avatar_url: 'http://i2.cdn.turner.com/cnnnext/dam/assets/111017060721-giant-panda-bamboo-story-top.jpg'})
    User.create({provider: 'fromCarl', uid: 'fdghfdfg', username: 'chillinvillin', email: 'oblaw@google.com', avatar_url: 'http://i2.cdn.turner.com/cnnnext/dam/assets/111017060721-giant-panda-bamboo-story-top.jpg'})
    User.create({provider: 'fromCarl', uid: 'fzxcvzxcv', username: 'wuttupdude', email: 'aw@google.com', avatar_url: 'http://i2.cdn.turner.com/cnnnext/dam/assets/111017060721-giant-panda-bamboo-story-top.jpg'})
    User.create({provider: 'fromCarl', uid: 'fgdfhjfdgh', username: 'woooo', email: 'bow@google.com', avatar_url: 'http://i2.cdn.turner.com/cnnnext/dam/assets/111017060721-giant-panda-bamboo-story-top.jpg'})
    User.create({provider: 'fromCarl', uid: 'fawestrzx', username: 'okthen', email: 'bo@google.com', avatar_url: 'http://i2.cdn.turner.com/cnnnext/dam/assets/111017060721-giant-panda-bamboo-story-top.jpg'})
    User.create({provider: 'fromCarl', uid: 'fjtrwsgdf', username: 'howudoin', email: 'baw@google.com', avatar_url: 'http://i2.cdn.turner.com/cnnnext/dam/assets/111017060721-giant-panda-bamboo-story-top.jpg'})


    Meetup.create({name: 'b2', description: 'meetup1', location: 'my house', creator_id: '1'})
    Meetup.create({name: 'a1', description: 'meetup2', location: 'my work', creator_id: '2'})
    Meetup.create({name: 'd4', description: 'meetup3', location: 'my park', creator_id: '3'})
    Meetup.create({name: 'c', description: 'meetup4', location: 'my yard', creator_id: '4'})
    Meetup.create({name: 'e', description: 'meetup5', location: 'my pool', creator_id: '4'})
    Meetup.create({name: 'h', description: 'meetup6', location: 'my garage', creator_id: '2'})
    Meetup.create({name: 'w', description: 'meetup7', location: 'my restaurant', creator_id: '5'})

    Membership.create({user_id: 8, meetup_id: 4})
    Membership.create({user_id: 1, meetup_id: 4})

  end
end
