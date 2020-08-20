package assignment_2

class BootStrap {

    def init = { servletContext ->
        if (Country.count() == 0) {
            Country bangladesh = new Country(name: 'Bangladesh').save()
            new State(country: bangladesh, name: 'Dhaka').save()
            new State(country: bangladesh, name: 'Patuakhali').save()
            Country india = new Country(name: 'India').save()
            new State(country: india, name: 'Delhi').save()
            new State(country: india, name: 'Mumbai').save()
        }
    }
    def destroy = {
    }
}
