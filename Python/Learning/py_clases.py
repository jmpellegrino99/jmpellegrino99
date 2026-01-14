class Employee:
    company_name = "OneBank"

    def __init__(self, name, salary, state):
        self.name = name
        self.salary = salary
        self.state = state

    def say_name(self):
        print(f"{self.name} lives in {self.state} and earns {self.salary} at {self.company_name}.")

    @classmethod
    def change_company(cls,new_name):
        cls.company_name = new_name

e1 = Employee("Joe", 125000, "Connecticut")

Employee.change_company("NewDrive")

e1.say_name()
