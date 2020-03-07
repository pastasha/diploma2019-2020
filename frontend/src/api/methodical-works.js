import { HTTP } from './common'
export const Methodical = {
    list () {
        return HTTP.get('/methodical/').then(response => {
            return response.data
        })
    }
};