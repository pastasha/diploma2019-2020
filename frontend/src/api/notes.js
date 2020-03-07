import { HTTP } from './common'
export const Note = {
    create (config) {
        return HTTP.post('/picture/', config).then(response => {
            return response.data
        })
    },
    delete (note) {
        return HTTP.delete(`/picture/${note.id}/`)
    },
    list () {
        return HTTP.get('/picture/').then(response => {
            return response.data
        })
    }
};