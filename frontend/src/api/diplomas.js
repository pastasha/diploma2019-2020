import { HTTP } from './common'
export const Diplomas = {
    list () {
        return HTTP.get('/diploma/').then(response => {
            return response.data
        })
    }
};