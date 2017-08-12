
User.create(user_name: "master", password: "p")

3.times {
  Deck.create( name: Faker::Superhero.name )
}

15.times {
  Card.create(
    deck_id: Deck.all.sample.id,
    question: Faker::Movie.quote + "?",
    answer: "please"
    )
}
