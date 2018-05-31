<template>
  <div class="comments_list">
    <h3>Comments</h3>
    <div v-for="comment in comments" class="card mb-2">
      <div class="card-body">
        <h5 class="card-title">{{comment.author}}</h5>
        <p class="card-text">{{comment.content}}</p>
      </div>
    </div>
    <new-comment-form />
  </div>
</template>

<script>
  import { mapState } from 'vuex'
  import newCommentForm from '../components/newCommentForm'

  export default {
    name: 'commentsList',
    computed: mapState([
      'comments'
    ]),
    mounted: function () {
      this.$store.dispatch('LOAD_COMMENTS_LIST')
    },
    components: {
      newCommentForm
    }
  }
</script>

<style scoped>
</style>