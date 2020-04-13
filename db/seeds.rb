3.times do |topic|
  Topic.create!(
    title: "TOpic #{topic}"
    )
end
puts "3 topics created"

10.times do |blog|
  Blog.create!(
    title: "My Blog post #{blog}",
    body: "sgsdfhbfghgffghfgegnd",
    topic_id:Topic.last.id
    )
end

1.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle: "Angular",
    body:"jzsnf",
    main_image:"http://placehold.it/600x400",
    thumb_image: "dklxfk"
    )
end
