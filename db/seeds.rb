# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create(
    [
      { username: 'Admin', email: 'admin@example.com', password: 'password' },
      { username: 'Czarek',email: 'czarek@example.org', password: 'password' }
    ]
)


articles = Article.create(
    [
        {title: 'First article',
         description:
                'Sed non scelerisque lorem. Aliquam ultrices elit ante, eget tincidunt est sagittis id.
Vivamus non odio sit amet metus scelerisque.',
         user_id: 1 },
        {title: 'Second article',
        description:
                'Sed non scelerisque lorem. Aliquam ultrices elit ante, eget tincidunt est sagittis id.
Vivamus non odio sit amet metus scelerisque.',
         user_id: 1 },
        {title: 'Third article',
         description:
                'Sed non scelerisque lorem. Aliquam ultrices elit ante, eget tincidunt est sagittis id.
Vivamus non odio sit amet metus scelerisque.',
        user_id: 2},
        {title: 'Test',
         description: 'Sed non scelerisque lorem. Aliquam ultrices elit ante, eget tincidunt est sagittis id.
Vivamus non odio sit amet metus scelerisque.',
         user_id: 2}
    ]
)