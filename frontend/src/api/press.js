import { HTTP } from './common'
export const Press = {
    list () {
        return HTTP.get('/methodical/').then(response => { //TODO must be press
            return response.data
        })
    }
};