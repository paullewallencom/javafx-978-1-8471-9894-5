class EmployeeController {

    def index = { }

    def save = {
        def emp = new Employee(params)
        params.each{k,v ->
            println "${k} = ${v}"
        }
        emp.save()
        [employee:emp.get(emp.id)]
    }
}
