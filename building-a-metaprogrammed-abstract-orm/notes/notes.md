Youtube Video Watched: https://www.youtube.com/watch?time_continue=112&v=hts7TjpPw-8&feature=emb_logo

Github link: https://github.com/SincerelyBrittany/lv-meta-orm

Steps taken
  Create folders
    App
      concerns
      models
        post.rb
    config
      environment.rb
    db
    notes
      notes.md
    Gemfile (see step 1)
    Gemfile.lock (automatically generated after running step 1)
    Rakefile (see step 2)


    Steps taken:
      1. Create gemfile and then run bundle install in terminal
      2. Create Rakefile then run gem install rake
      3. require rake in your gemfile
      4. require pry in your gemfile
      5. require_all from app in your gemfile
      6. require bundler in your environment
      7. connect database in environment
          DB ={:conn => SQLite3::Database.new("db/blog.db")}
      8.

    Run by typing rake console
      1. To create database -
          Post.create_table
      2. TO remove database
          rm -rf db/blog.db
      3. To open database
          open db/blog.db

      Goal
      1. p = Post.new
      2. p.title = "first save"
      3. p.insert

      1. Post.find(1)



      Goal
      1. self.id = DB[:conn].execute("SELECTlast_insert_rowid();").flatten.first



    Gemfile/bundler documentation: https://bundler.io/man/bundle-add.1.html

    Rakefile documentation: https://github.com/ruby/rake

    Pry documentation: https://github.com/pry/pry

    SQLite3 documentation: https://www.rubydoc.info/github/luislavena/sqlite3-ruby/SQLite3/Database

    ActiveRecordBase Documentation: https://api.rubyonrails.org/classes/ActiveRecord/Base.html

    ActiveRecordBase Documentation(github): https://github.com/rails/rails/blob/34991a6ae2fc68347c01ea7382fa89004159e019/activerecord/lib/active_record/base.rb


            new_post = Post.new
               #<Post:0x00007ffd1db3b560>
            new_post.title = "practice"
                "practice"
            new_post.insert
                2
            new_post
                #<Post:0x00007ffd1db3b560 @id=2, @title="practice">
            new_post == Post.find(2)
               TRUE (without this method the id would not be set or matched)

        WHAT IS splatter
          def three_args(one, two, three)
              puts one
              puts two
              puts three
          end

          #if you run the following
            three_args([1,2,3])
          #youll get an argument error for having the wrong amount of arguments
          # it will say you gave one when it required 3
          #to avoid this you must use splatter which consist of
            three_args(*[1,2,3])


        #Makes your page less vulunerable
          /posts/1
          Post.find(params[:id])
          SELECT * FROM posts WHERE ; DROP TABLE users;

          INJECTION example
          p.title = "whatever); DROP TABLE posts;"

          1.26.00 minutes in youtube video

the data can come from a user you never want to inject it directly in the sql, you want the driver to santize and that there are no semicolons.
        WHenever someone has the ability to
