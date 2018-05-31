import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

axios.defaults.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
axios.defaults.headers.common['Accept'] = 'application/json'

Vue.use(Vuex);

const store = new Vuex.Store({
  state: {
    object_type: '',
    object_id: '',
    api_endpoint: '',
    comments: []
  },
  actions: {
    LOAD_COMMENTS_LIST: function ({ commit }) {
      axios.get(this.state.api_endpoint).then((response) => {
        commit('SET_COMMENTS_LIST', { list: response.data })
      }, (err) => {
        alert('Sorry, but something went wrong!')
        console.log(err)
      })
    },
    ADD_NEW_COMMENT: function ({ commit }, { comment }) {
      axios.post(this.state.api_endpoint, comment).then((response) => {
        commit('ADD_COMMENT', { comment: response.data })
      }, (err) => {
        alert('Sorry, but something went wrong!')
        console.log(err)
      })
    }
  },
  mutations: {
    SET_PARENT_OBJECT: (state, payload) => {
      state.object_type = payload.object_type;
      state.object_id = payload.object_id
      state.api_endpoint = '/comments?' + state.object_type + '_id=' + state.object_id
    },
    SET_COMMENTS_LIST: (state, { list }) => {
      state.comments = list
    },
    ADD_COMMENT: (state, { comment }) => {
      state.comments.push(comment)
    }
  },
  getters: {
  },
  modules: {
  }
});

export default store