import { HTTP } from './common'
export const Exhibitions = {
    list () {
        return HTTP.get('/exhibition/').then(response => {
            return response.data
        })
    }
};