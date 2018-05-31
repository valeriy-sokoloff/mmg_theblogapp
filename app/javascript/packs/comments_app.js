/* eslint no-console: 0 */

import Vue from 'vue'
import CommentsList from '../components/comments_list'
import store from '../store'

document.addEventListener('DOMContentLoaded', () => {
  const el = document.getElementById('comments_app');

  const vm = new Vue({
    el,
    beforeMount(){
      this.$store.commit('SET_PARENT_OBJECT',
        {
          object_type: this.$el.attributes['data-object-type'].value,
          object_id: this.$el.attributes['data-object-id'].value
        })
    },
    store,
    render: h => h(CommentsList)
  })
});
