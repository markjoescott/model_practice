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
    @longest_movie = Movie.order("duration DESC").first.director.name
    # @the_director = Director.find_by({:id => @longest_movie})

    @director_of_longest_movie = @longest_movie
  end

  def question_3
    # Which director has the most movies on the list?

    # Your Ruby goes here.


    the_top_director = Director.first

    Director.all.each do |director|

      if the_top_director.movies.count < director.movies.count

        the_top_director = director

      end

    end

    @director_with_the_most_movies = the_top_director.name
  end

  def question_4
#     # Which actor has been in the most movies on the list?
#     # (If there's a tie, any one of them is fine)

# #     # Your Ruby goes here.


    @actor_with_the_most_movies = Actor.first

    Actor.all.each do |actor|

      if @actor_with_the_most_movies.movies.count < actor.movies.count

        @actor_with_the_most_movies = actor
        end
      end
    end


#   movie_counts = []

#     Actor.all.each do |the_actor|
#       number_of_movies_by_an_actor = the_actor.movies.count
#       result = {:name => the_actor.name, :count => the_actor.movies.count}
#       movie_counts.push(result)
#     end
# sorted_list = movies_counts.sort do |a,b|

# b[:count] <=> a[:count]






#     @actor_with_the_most_movies = sorted_list.first


  def question_5


#     # This one is hard. Work on it after all your other review is complete.

#     # Which actor/director pair has the most movies on the list?
#     # (If there's a tie, any pair of them is fine)

#     # Your Ruby goes here.

#   #   @movies_together = 0

#   #   Actor.all.each do |actor|


#   #   end

#   #   Director.all.each do |director|


#   #   end
#   # if

#   # end
#   #   # @actor = ???
#   #   # @director = ???
#   #   # @movies_together = ???

   most_movies_together = 0

   @actor = nil

   @director = nil



   Actor.all.each do |actor|

     this_actors_most_movies_with_one_director = 0
      this_actors_favorite_director = nil



     actor.movies.each do |movie|

      number_of_movies_with_same_director_as_this_one = actor.movies.where(:director_id => movie.director_id).count



       if this_actors_most_movies_with_one_director < number_of_movies_with_same_director_as_this_one
         this_actors_most_movies_with_one_director = number_of_movies_with_same_director_as_this_one
         this_actors_favorite_director = movie.director

       end
     end



     if most_movies_together < this_actors_most_movies_with_one_director
       most_movies_together = this_actors_most_movies_with_one_director
       @director = this_actors_favorite_director
       @actor = actor

     end
   end



   @movies_together = @actor.movies.where(:director_id => @director.id)
  end
end
