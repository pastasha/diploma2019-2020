import Vue from 'vue'
import Vuex from 'vuex'
import { Note, Methodical, Diplomas,
    Exhibitions, Press, diplomaPhotos,
    galleryPhotos, Comment } from '../api/common'
import { SET_NOTES,
SET_METHODICAL,
SET_DIPLOMAS,
SET_EXHIBITIONS,
SET_PRESS,
SET_DIPLOMA_PHOTOS,
SET_GALLERY_PHOTOS,
SET_COMMENTS}
from './mutation-types.js'

Vue.use(Vuex);

// Состояние
const state = {
    notes: [],
    methodical: [],
    diplomas: [],
    exhibitions: [],
    press: [],
    diploma_photos: [],
    gallery_photos: [],
    comments: []// список заметок
};
// Геттеры
const getters = {
    notes: state => state.notes,
    methodical: state => state.methodical,
    diplomas: state => state.diplomas,
    exhibitions: state => state.exhibitions,
    press: state => state.press,
    diploma_photos: state => state.diploma_photos,
    gallery_photos: state => state.gallery_photos,
    comments: state => state.comments// получаем список заметок из состояния
};
// Мутации
const mutations = {
    // Задаем список заметок
    [SET_NOTES] (state, { notes }) {
        state.notes = notes
    },
    [SET_METHODICAL] (state, { methodical }) {
        state.methodical = methodical
    },
    [SET_DIPLOMAS] (state, { diplomas }) {
        state.diplomas = diplomas
    },
    [SET_EXHIBITIONS] (state, { exhibitions }) {
        state.exhibitions = exhibitions
    },
    [SET_PRESS] (state, { press }) {
        state.press = press
    },
    [SET_GALLERY_PHOTOS] (state, { gallery_photos }) {
        state.gallery_photos = gallery_photos
    },
    [SET_DIPLOMA_PHOTOS] (state, { diploma_photos }) {
        state.diploma_photos = diploma_photos
    },
    [SET_COMMENTS] (state, { comments }) {
        state.comments = comments
    }
};

// Действия
const actions = {
    getNotes ({ commit }) {
        Note.list().then(notes => {
            commit(SET_NOTES, { notes })
        })
    },
    getMethodical ({ commit }) {
        Methodical.list().then(methodical => {
            commit(SET_METHODICAL, { methodical })
        })
    },
    getDiplomas ({ commit }) {
        Diplomas.list().then(diplomas => {
            commit(SET_DIPLOMAS, { diplomas })
        })
    },
    getExhibitions ({ commit }) {
        Exhibitions.list().then(exhibitions => {
            commit(SET_EXHIBITIONS, { exhibitions })
        })
    },
    getPress ({ commit }) {
        Press.list().then(press => {
            commit(SET_PRESS, { press })
        })
    },
    getDiplomaPhotos ({ commit }) {
        diplomaPhotos.list().then(diploma_photos => {
            commit(SET_DIPLOMA_PHOTOS, { diploma_photos })
        })
    },
    getGalleryPhotos ({ commit }) {
        galleryPhotos.list().then(gallery_photos => {
            commit(SET_GALLERY_PHOTOS, { gallery_photos })
        })
    },
    getComments ({ commit }) {
        Comment.list().then(comments => {
            commit(SET_COMMENTS, { comments })
        })
    }
};

export default new Vuex.Store({
    state,
    getters,
    actions,
    mutations
})