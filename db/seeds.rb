# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


articles = Article.create(
    [
        {title: 'First article',
         description: 'Sed non scelerisque lorem. Aliquam ultrices elit ante, eget tincidunt est sagittis id. Vivamus non odio sit amet metus scelerisque.'
        },
        {title: 'Second article',
         description: 'Sed non scelerisque lorem. Aliquam ultrices elit ante, eget tincidunt est sagittis id. Vivamus non odio sit amet metus scelerisque.'
        },
        {title: 'Third article',
         description: 'Sed non scelerisque lorem. Aliquam ultrices elit ante, eget tincidunt est sagittis id. Vivamus non odio sit amet metus scelerisque.'
        },
        {title: 'Test',
        description: 'Sed non scelerisque lorem. Aliquam ultrices elit ante, eget tincidunt est sagittis id. Vivamus non odio sit amet metus scelerisque.'
        }
    ]
)