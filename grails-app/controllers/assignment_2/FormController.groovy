package assignment_2

class FormController {

    def index() { }
    def countryChanged(long countryId) {
        Country country = Country.get(countryId)
        def states = []
        if ( country != null ) {
            states = State.findAllByCountry(country, [order:'name'])
        }
        render g.select(id:'subCategory', name:'subCategory.id',
                from:states, optionKey:'id', noSelection:[null:' ']
        )
    }

}
