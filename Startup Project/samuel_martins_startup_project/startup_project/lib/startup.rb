require "employee"

class Startup

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def name
        @name
    end

    def funding
        @funding
    end

    def salaries
        @salaries
    end

    def employees
        @employees
    end

    def valid_title?(title)
        @salaries.keys.include?(title)
    end

    def >(startup)
       self.funding > startup.funding 
    end

    def hire(employee_name, title)
        if !valid_title?(title)
            raise ArgumentError.new "invalid title"
        else
            @employees << Employee.new(employee_name, title)  
        end
    end

    def size 
        @employees.length
    end
    
    def pay_employee(employee)
        amount = @salaries[employee.title]
        if @funding > amount
            employee.pay(amount)
            @funding -= amount
        else
            raise ArgumentError.new "no funds"
        end
    end

    def payday
        @employees.each { |employee| pay_employee(employee) }
    end

    def average_salary 
        sum = 0
        @employees.each { |employee| sum += @salaries[employee.title] }
        sum/@employees.length
    end

    def close 
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        salaries = @salaries
        @funding += startup.funding
        startup.salaries.each { |title, salary| salaries[title] = salary if !@salaries.has_key?(title) }
        @employees += startup.employees 
        startup.close
    end

    
end
