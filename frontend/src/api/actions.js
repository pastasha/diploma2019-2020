import {HTTP} from "./common";

export const Picture = {
    list (){
        return HTTP.get('/picture/').then(response => {
            return response.data
        })
    }
};