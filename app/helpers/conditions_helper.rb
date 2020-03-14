module ConditionsHelper
  
  def graph
    
    graph = {
      "meal" => [],
      "defecation" => [],
      "sleep" => [],
      "alcohol" => [],
      "exercise" => [],
      "stress" => []
    }
    
    @conditions.each do | condition |
      graph["meal"].push( [ condition.condition_date,condition.meal ] )
      graph["defecation"].push( [ condition.condition_date,condition.defecation ] )
      graph["sleep"].push( [ condition.condition_date,condition.sleep ] )
      graph["alcohol"].push( [ condition.condition_date,condition.alcohol ] )
      graph["exercise"].push( [ condition.condition_date,condition.exercise ] )
      graph["stress"].push( [ condition.condition_date,condition.stress ] )
    end
    
    array = []
    
    if !@graph_keys.nil?
      @graph_keys.each do |key|
        array.push( {"name"=> key, "data"=> graph[key] } )
        @output = array
      end
    else
      graph_keys = ["meal","defecation","sleep","alcohol","exercise","stress"]
      graph_keys.each do |key|
        array.push( {"name"=> key, "data"=> graph[key] } )
      end
      
      @output = array
    end
  end
  
end
