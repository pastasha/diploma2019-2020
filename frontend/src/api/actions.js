import {HTTP} from "./common";

export const Object = {
    create (config) {         //TODO delete it!
        return HTTP.post('/objects/', config).then(response => {
            return response.data
        })
    },
    delete(note){             //TODO delete it!
        return HTTP.delete('/objects/${object.id}/')
    },
    list (){
        return HTTP.get('/objects/').then(response => {
            return response.data
        })
    }
}