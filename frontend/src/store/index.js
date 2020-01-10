import Vue from 'vue'
import Vuex from 'vuex'
import { Picture } from '../api/pictures'
import {SET_PICTURES} from "./mutation-types";

Vue.use(Vuex);

const state = {
    pictures: [] //list of objects
};

const getters = {
    pictures: state => state.pictures // getting a list of objects
};

const mutations = {
    [SET_PICTURES] (state, {pictures}){
        state.pictures = pictures
    }
};

const actions = {
  getPictures ({ commit }) {
    Picture.list().then(pictures => {
      commit(SET_PICTURES, { pictures })
    })
  }
};

export default new Vuex.Store({
  state,
  getters,
  actions,
  mutations
})