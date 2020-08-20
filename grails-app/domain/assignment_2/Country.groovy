package assignment_2

class Country {

    static hasMany = [states: State]
    String name
    static constraints = {
    }
    String toString(){
        return name
    }
}
