def stock_picker(arr)
    lowest = arr.min()
    highest = arr.max()
    best_buy_day = arr.find_index(lowest)
    best_sell_day = arr.find_index(highest)
    #if best buy day is last, find the next best buy day
    if best_buy_day == arr.length - 1
      new_arr = arr.clone
      new_arr.pop
      next_best_buy_day = new_arr.min
      best_buy_day = arr.find_index(next_best_buy_day)
    end
    #if best sell day is first, find the next best sell day
    if best_sell_day == 0
      new_arr = arr.clone
      new_arr.shift
      next_best_sell_day = new_arr.max
      best_sell_day = arr.find_index(next_best_sell_day)
    end
    #if best buy day is later than best sell day, find next best     buy day
    #because must buy before sell
    if best_buy_day > best_sell_day
      new_arr.clone.delete_at(best_buy_day)
      new_best_buy_day = new_arr.min
      best_buy_day = new_best_buy_day
    end
    #return best days array
    p best_days = [best_buy_day,best_sell_day]
    return best_days
  end 
  
  stock_picker([17,3,6,9,15,8,6,1,10])