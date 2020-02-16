module ConditionsHelper
  
  def graph
    
    meal = []
    defecation = []
    sleep = []
    alcohol = []
    exercise = []
    stress = []
    
    @conditions.each do | condition |
      meal.push( [ condition.condition_date,condition.meal ] )
      defecation.push( [ condition.condition_date,condition.defecation ] )
      sleep.push( [ condition.condition_date,condition.sleep ] )
      alcohol.push( [ condition.condition_date,condition.alcohol ] )
      exercise.push( [ condition.condition_date,condition.exercise ] )
      stress.push( [ condition.condition_date,condition.stress ] )
    end
    
    @output = [
           {"name"=>"meal", "data"=> meal },
           {"name"=>"defecation", "data"=> defecation },
           {"name"=>"sleep", "data"=> sleep },
           {"name"=>"alcohol", "data"=> alcohol },
           {"name"=>"exercise", "data"=> exercise },
           {"name"=>"stress", "data"=> stress },
          ]
  end
  
end
