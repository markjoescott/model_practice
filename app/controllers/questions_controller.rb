class QuestionsController < ApplicationController
  def question_1
    # What is the most recent movie on the list that the second actor appeared in?

    # # # # Your Ruby goes here.
    @the_actor = Actor.find(2656).movies.order("year DESC").first.title

    @most_recent_movie_for_second_actor = @the_actor



  end

  def question_2
  #   Who directed the longest movie on the list?

    # # # # Your Ruby goes here.
    @longest_movie = Movie.order("duration DESC").first.director_id
    @the_director = Director.find_by({:id => @longest_movie})

    @director_of_longest_movie = @the_director.name
  end

  def question_3
    # Which director has the most movies on the list?

    # Your Ruby goes here.


  the_top_director = Director.new

  Director.all.each do |director|

    if

    the_top_director.movies.count > director.movies.count

    the_top_director = director

end
end

    @director_with_the_most_movies = the_top_director.name


end

  def question_4
    # Which actor has been in the most movies on the list?
    # (If there's a tie, any one of them is fine)

#     # Your Ruby goes here.


  the_actor = Actor.new

  Actor.all.each do |actor|

  if
      the_actor.movies.count > actor.movies.count

      the_actor = actor

    end

  @actor_with_the_most_movies = the_actor
#   movie_counts = []

#     Actor.all.each do |the_actor|
#       number_of_movies_by_an_actor = the_actor.movies.count
#       result = {:name => the_actor.name, :count => the_actor.movies.count}
#       movie_counts.push(result)
#     end
# sorted_list = movies_counts.sort do |a,b|

# b[:count] <=> a[:count]






    # @actor_with_the_most_movies = sorted_list.first
end
end

  def question_5


    # This one is hard. Work on it after all your other review is complete.

    # Which actor/director pair has the most movies on the list?
    # (If there's a tie, any pair of them is fine)

    # Your Ruby goes here.

    # @actor = ???
    # @director = ???
    # @movies_together = ???
  end
end
