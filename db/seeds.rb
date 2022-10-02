# 15.times do
#     Article.create({
#         title: Faker::Book.title,
#         body: Faker::Lorem.sentence(word_count: 100),
#         category_id: Faker::Number.between(from: 1, to: 5)
#     })
# end

3.times do
    Image.create({
        article_id: 3,
        image_url: 'sample cat 3',
    })
end

3.times do
    Image.create({
        article_id: 4,
        image_url: 'sample cat 4',
    })
end

3.times do
    Image.create({
        article_id: 5,
        image_url: 'sample cat 5',
    })
end

3.times do
    Image.create({
        article_id: 6,
        image_url: 'sample cat 6',
    })
end

3.times do
    Image.create({
        article_id: 7,
        image_url: 'sample cat 7',
    })
end

3.times do
    Image.create({
        article_id: 8,
        image_url: 'sample cat 8',
    })
end

3.times do
    Image.create({
        article_id: 9,
        image_url: 'sample cat 9',
    })
end

3.times do
    Image.create({
        article_id: 10,
        image_url: 'sample cat 10',
    })
end

3.times do
    Image.create({
        article_id: 11,
        image_url: 'sample cat 11',
    })
end

3.times do
    Image.create({
        article_id: 12,
        image_url: 'sample cat 12',
    })
end

3.times do
    Image.create({
        article_id: 13,
        image_url: 'sample cat 13',
    })
end

3.times do
    Image.create({
        article_id: 14,
        image_url: 'sample cat 14',
    })
end

3.times do
    Image.create({
        article_id: 15,
        image_url: 'sample cat 15',
    })
end