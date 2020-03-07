import Vue from 'vue'
import Vuex from 'vuex'
import { Note } from '../api/notes'
import {Methodical} from "../api/methodical-works";
import { Diplomas } from "../api/diplomas";
import { Exhibitions } from '../api/exhibitions'
import { Press } from "../api/press";
import { SET_NOTES,
SET_METHODICAL,
SET_DIPLOMAS,
SET_EXHIBITIONS,
SET_PRESS}
from './mutation-types.js'

Vue.use(Vuex);

// Состояние
const state = {
    notes: [],
    methodical: [],
    diplomas: [],
    exhibitions: [],
    press: []  // список заметок
};
// Геттеры
const getters = {
    notes: state => state.notes,
    methodical: state => state.methodical,
    diplomas: state => state.diplomas,
    exhibitions: state => state.exhibitions,
    press: state => state.press// получаем список заметок из состояния
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
    }
};

export default new Vuex.Store({
    state,
    getters,
    actions,
    mutations
})