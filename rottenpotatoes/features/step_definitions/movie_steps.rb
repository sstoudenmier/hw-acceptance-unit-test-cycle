
Given /the following movies exist/ do |movies_table|
  
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    # hint: look at movies_controller#create for a hint toward the one-line solution.
    Movie.create!(movie)	
  end
end

Then /the director of "(.*)" should be "(.*)"/ do |title, director|
    step %Q{I should see "#{title}"}
    step %Q{I should see "#{director}"}
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
    # HINT: use String#split to split up the rating_list, then
    #   iterate over the ratings and reuse the "When I check..." or
    #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
    rating_list.split.each do |rating|
        step %Q{I #{uncheck}check ratings_#{rating}}
    end
end

Then /I should( not)? see the following movies: (.*)/ do |notsee, movies|
    movies.split.each do |title|
        step %Q{I should#{notsee} see #{title}}
    end
end

Then /I should see all the movies/ do
    # Make sure that all the movies in the app are visible in the table
    Movie.all.each do |movie|
        step %Q{I should see #{movie.title}}
    end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page
Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
    #  ensure that that e1 occurs before e2.
    #  Hint: page.body is the entire content of the page as a string.
    #page.body.should =~ /Alien.*Blade Runner/
    page.text.should match(/#{e1}.*#{e2}/)
end

Then /"(.*)" should be deleted/ do |movie|
   page.text.should match(/(Movie '#{movie}' deleted)(?!#{movie})/)
end