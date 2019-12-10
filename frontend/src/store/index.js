import Vue from 'vue'
import Vuex from 'vuex'
import {Object} from '../api/actions'
import {SET_OBJS} from "./mutation-types";

Vue.use(Vuex)

//state
const state = {
    objects: [] //list of objects
}

const getters = {
    objects: state => state.objects // getting a list of objects
}

const mutations = {
    [SET_OBJS] (state, {objects}){
        state.objects = objects
    }
}

const actions = {
  getObjs ({ commit }) {
    Object.list().then(objects => {
      commit(SET_OBJS, { objects })
    })
  }
}

export default new Vuex.Store({
  state,
  getters,
  actions,
  mutations
})