import {HTTP} from "./common";

export const Picture = {
    list (){
        return HTTP.get('/pictures/').then(response => {
            return response.data
        })
    }
}