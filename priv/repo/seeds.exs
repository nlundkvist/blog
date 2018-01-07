defmodule Blog.DatabaseSeeder do
   alias Blog.Repo
   alias Blog.Posts.{Post, Author}

   @paragraphs_list [
       "Aliquam tincidunt aliquam ultricies. Mauris eget turpis pulvinar, ornare arcu ac, scelerisque nisi. Vivamus gravida ornare lacus, at sagittis lorem auctor mattis. Vivamus non nisl nec dolor dignissim commodo. In scelerisque scelerisque metus tristique bibendum. Pellentesque quam arcu, vulputate non placerat at, sollicitudin non purus. Aliquam eleifend nulla porttitor turpis facilisis elementum. Duis cursus, augue sit amet eleifend blandit, tellus turpis accumsan nunc, id ultrices orci turpis imperdiet mi. Aliquam pellentesque enim non tincidunt accumsan. Nullam gravida eu nisi ut imperdiet. Duis sed arcu molestie, vestibulum arcu id, pharetra eros. Ut id nunc sed ipsum posuere placerat. Curabitur efficitur nulla vitae lorem congue, ut pulvinar enim pretium. Ut consequat turpis eget pellentesque tempor. Integer purus metus, interdum et luctus id, auctor a lectus. Nulla vulputate purus ut massa tempor lacinia.",
       "In vitae euismod massa, a congue nisi. Cras dictum varius ipsum sit amet ornare. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ac vulputate arcu. Maecenas sollicitudin est nec tellus auctor ultricies. Suspendisse condimentum, mi sit amet condimentum bibendum, dui tortor pulvinar ante, ut interdum tortor augue nec quam. Morbi vehicula sodales orci nec congue. Morbi pharetra rhoncus magna. Praesent ac molestie felis. Cras id mattis erat, a finibus diam.",
       "Vivamus vel suscipit nunc. Morbi mi enim, iaculis sed ligula eu, accumsan auctor dui. Praesent vitae placerat urna, vitae venenatis justo. Quisque ut massa vel dui commodo tempus. Quisque sed risus sem. Curabitur luctus tortor ac lacus sagittis eleifend. Nullam rhoncus maximus felis, in tristique mauris. Morbi mattis metus ut consectetur luctus. Duis in purus odio. Fusce a nulla risus. Donec semper, mauris non ullamcorper lobortis, est libero egestas purus, in semper ante sem ac ex.",
       "Vivamus et risus eget nunc feugiat egestas eget ut ex. Mauris lacus mi, lobortis non massa at, commodo pulvinar odio. Nam vestibulum ligula sit amet velit iaculis, vitae egestas sapien egestas. Aliquam quis pharetra neque, eu maximus lacus. Aliquam ac aliquam ante. Suspendisse potenti. Nullam vitae volutpat mauris, non faucibus metus. Aenean ut interdum leo, ac vehicula mi.",
       "Nam nisi sem, placerat vitae massa eget, ultricies elementum lectus. Pellentesque quis iaculis purus, feugiat rutrum arcu. In tincidunt eget sapien non congue. Morbi laoreet rhoncus purus vitae tristique. Duis semper enim quis dolor commodo, pretium feugiat purus posuere. Morbi blandit eros id porttitor aliquam. Phasellus semper sit amet elit eget hendrerit. Maecenas imperdiet, tortor molestie vestibulum sodales, ante metus pulvinar risus, non scelerisque massa lacus et nisi.",
       "Suspendisse potenti. Integer ac elit accumsan, egestas erat at, malesuada nulla. In hac habitasse platea dictumst. Proin tincidunt mi dui, at euismod eros accumsan vitae. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed eget ex varius, rutrum odio ut, posuere ligula. Nullam nec felis mi. Nulla at ligula eget lectus scelerisque suscipit.",
       "Nulla vel ipsum at quam tincidunt tristique. Sed pretium feugiat rutrum. Etiam scelerisque sem non ex imperdiet, sed vehicula ante lacinia. Phasellus ex metus, semper eu ultrices id, aliquam in erat. Suspendisse augue mauris, bibendum sit amet luctus a, eleifend quis lorem. Fusce convallis faucibus sollicitudin. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent interdum quam augue, non euismod enim efficitur finibus. Fusce eget volutpat quam. Nam scelerisque facilisis risus, a aliquam nisi volutpat sed. Ut pharetra sed nisl sed fringilla. Morbi ultricies bibendum purus at accumsan. Nam vitae porta urna. Aenean condimentum blandit purus nec commodo. Proin scelerisque elit eget felis blandit consectetur.",
       "Nulla ipsum nibh, aliquet nec consectetur eu, dignissim condimentum lectus. Donec molestie ligula vitae turpis imperdiet molestie at ut nisl. Nullam in venenatis mauris, ut efficitur ex. Donec in suscipit enim, id tempus tortor. Vestibulum ac massa pretium, pharetra nisi et, congue nibh. Aliquam consectetur ligula quis libero pretium, vitae aliquam leo aliquet. Pellentesque sit amet nisi purus. Vivamus pretium neque et augue placerat, ut pharetra felis cursus. Quisque vitae velit suscipit, tincidunt dolor sed, lobortis lacus. Praesent orci quam, semper sit amet justo ut, pretium faucibus diam. Nulla felis ex, suscipit sed convallis sit amet, accumsan sed elit. Mauris consectetur fringilla ultrices. Curabitur sed massa gravida, accumsan ipsum nec, porttitor leo.",
       "Nullam vehicula augue auctor, ullamcorper mi at, efficitur elit. Donec rhoncus dictum dignissim. Quisque nec justo lorem. Etiam suscipit congue dapibus. Maecenas eu nibh at justo facilisis sodales vitae vel lacus. Cras rhoncus lorem eget porta sodales. Etiam vitae posuere sem, eget mattis leo. Nullam blandit elit at turpis dapibus commodo. Aliquam vitae egestas purus. Nullam sit amet sapien ut tellus congue tempor ac vehicula lorem. Phasellus cursus dapibus dapibus. Sed nec leo quis massa rhoncus iaculis vel sollicitudin risus. Quisque consequat felis id tortor tincidunt hendrerit.",
       "Vivamus ut scelerisque quam, vel dignissim magna. Fusce in consectetur nulla. Suspendisse venenatis metus ut velit malesuada, eget ullamcorper dolor condimentum. Aliquam quam enim, pellentesque vel sagittis in, ornare a ipsum. Ut molestie rhoncus libero vel blandit. Integer vel dui felis. Pellentesque dignissim feugiat nunc sed volutpat. Vivamus consectetur consectetur posuere. Sed maximus diam justo, a gravida dolor ultrices blandit. Donec magna ante, faucibus in purus et, viverra molestie ligula. Morbi dignissim risus eu suscipit aliquam. Sed ut urna laoreet, porttitor lectus ut, varius nibh. Donec feugiat, ante a imperdiet sagittis, ipsum ligula dapibus nibh, at mattis urna mi in magna." 
  ]

   @titles_list [
       "Pellentesque eu tempor magna. Interdum et",
       "Cras tempus turpis sed justo consequat",
       "Duis fringilla leo id nulla tincidunt, sit amet consequat augue facilisis",
       "Aliquam sed rhoncus odio. Curabitur ut posuere nisi. Mauris sed efficitur",
       "Vestibulum massa purus, dignissim ac est at, viverra interdum sem",
       "Aliquam vestibulum at ex nec rutrum. Phasellus sodales vel nisl",
       "Etiam luctus erat eu eros sollicitudin, tincidunt dapibus neque tincidunt",
       "Interdum et malesuada fames ac ante ipsum primis in faucibus, vivamus egestas",
       "Maecenas sed lacus at neque scelerisque vehicula tempor quis nibh",
       "Nulla vel dolor volutpat, malesuada metus a, tempus"
  ]

   def insert_author do
       %Author{name: "Niklas Lundkvist", github_user: "nlundkvist"}
       |> Repo.insert!
   end

   def insert_post(title, author_id) do
    %Post{
        title: title,
        content: generate_post_content(),
        author_id: author_id,
        slug: Slugger.slugify_downcase(title)
    }
    |> Repo.insert!
   end

   def generate_post_content do
    Enum.take_random(@paragraphs_list, 3..6 |> Enum.take_random(1) |> List.first)
    |> Enum.join("\n\n")
   end

   def titles_list do
       @titles_list
   end
end

Blog.DatabaseSeeder.insert_author
Blog.DatabaseSeeder.titles_list
|> Enum.each(&(Blog.DatabaseSeeder.insert_post(&1,1)))