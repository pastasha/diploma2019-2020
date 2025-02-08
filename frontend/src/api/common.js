import axios from 'axios'
export const HTTP = axios.create({
    baseURL: 'http://localhost:8000/api/'
});

export const HTTP_bot = axios.create({
    baseURL: 'http://localhost:8000/bot/'
});

export const Diplomas = {
    list () {
        return HTTP.get('/diploma/').then(response => {
            return response.data
        })
    }
};

export const diplomaPhotos = {
    list () {
        return HTTP.get('/photo-diploma/').then(response => {
            return response.data
        })
    }
};

export const Exhibitions = {
    list () {
        return HTTP.get('/exhibition/').then(response => {
            return response.data
        })
    }
};

export const Methodical = {
    list () {
        return HTTP.get('/methodical/').then(response => {
            return response.data
        })
    }
};

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

export const galleryPhotos = {
    list () {
        return HTTP.get('/photo-gallery/').then(response => {
            return response.data
        })
    }
};

export const Press = {
    list () {
        return HTTP.get('/press/').then(response => {
            return response.data
        })
    }
};

export const Comment = {
    list () {
        return HTTP_bot.get('/comment/').then(response => {
            return response.data
        })
    }
};