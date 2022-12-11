class Monkey

    def initialize (index, items, operation, divisibleNumber, trueDestination, falseDestination, inspectedCount = 0)
      @index = index
      @items = items
      @operation = operation
      @divisibleNumber = divisibleNumber
      @trueDestination = trueDestination
      @falseDestination = falseDestination
      @inspectedCount = inspectedCount
    end
    
    attr_reader :index, :items, :operation, :divisibleNumber, :trueDestination, :falseDestination, :inspectedCount
    attr_writer :items, :inspectedCount
    
    def getWorryLevel(itemValue)
      self.inspectedCount += 1
      return eval(self.operation.gsub("old", itemValue.to_s))
    end
    
    def getDestination(worryLevel)
      return worryLevel % self.divisibleNumber == 0 ? self.trueDestination : self.falseDestination
    end
  end
  
  monkeys = Array.new
  
  $stdin.readlines().each_slice(7) do |a|
    a = a.each { |a| a.strip! if a.respond_to? :strip! }
  
    monkeys.append(
      Monkey.new(
        a[0].scan(/\d+/).first, 
        a[1].scan(/\d+/).map(&:to_i), 
        a[2].split('= ', 2)[1], 
        a[3].scan(/\d+/).first.to_i, 
        a[4].scan(/\d+/).first.to_i, 
        a[5].scan(/\d+/).first.to_i
      )
    )
  end
  lcm = monkeys.map{|monkey| monkey.divisibleNumber}.reduce(&:lcm)
  
  10000.times {
    monkeys.each do |monkey|
      monkey.items.each do |item|
        item %= lcm
        worryLevel = monkey.getWorryLevel(item)
        destination = monkey.getDestination(worryLevel)
        monkeys[destination].items.append(worryLevel)
      end
      monkey.items = []
    end
  }
  
  
  bestIndividuals = monkeys.max_by(2) { |n| n.inspectedCount }.sort_by { |n| -n.inspectedCount }
  print(bestIndividuals[0].inspectedCount * bestIndividuals[1].inspectedCount)