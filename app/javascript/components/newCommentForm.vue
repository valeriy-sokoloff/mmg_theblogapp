<template>
  <div class="new_comment_form">
    <a href="#" v-if="!showNewForm" @click.prevent="toggleNewCommentForm">New Comment</a>

    <div v-if="showNewForm" class="card">
      <div class="card-body">
        <h5 class="card-title">New Comment</h5>

        <div class="form-group">
          <input type="text" class="form-control" v-model="newCommentAuthor" placeholder="Author">
        </div>

        <div class="form-group">
          <input type="text" class="form-control" v-model="newCommentContent" placeholder="Content">
        </div>

        <div>
          <a href="#" @click.prevent="createComment">Create</a> |
          <a href="#" @click.prevent="toggleNewCommentForm">Cancel</a>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'newCommentForm',
    data: function () {
      return {
        showNewForm: false,
        newCommentAuthor: '',
        newCommentContent: ''
      }
    },
    methods: {
      toggleNewCommentForm: function(){
        this.newCommentAuthor = '';
        this.newCommentContent = '';
        this.showNewForm = !this.showNewForm
      },
      createComment: function(){
        this.$store.dispatch('ADD_NEW_COMMENT', {comment: {author: this.newCommentAuthor, content: this.newCommentContent}})
        this.toggleNewCommentForm()
      }
    }
  }
</script>

<style scoped>
  .card{
    background-color: #f0f0f0;
  }
</style>