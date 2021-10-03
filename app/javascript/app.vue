<template>
<div>
  <div>
      <div v-for="msg in messages" :key="msg.id">
        <div>
          <div class="text-center">{{ msg.content }}</div>
      </div>
    </div>
  </div>
  <div>
    <div class="ml-5">
      <input type="text" v-model="message.user_id" placeholder="userId">
      <input type="text" v-model="message.content" placeholder="入力してください ...">
      <span>
        <button class="btn btn-primary" type="button" v-if="messageChannel" @click="speak">送信</button>
      </span>
    </div>
  </div>
</div>
</template>

<script>
import axios from 'axios';

export default {
  mounted () {
    axios
      .get('/messages.json')
      .then(response => (this.messages = response.data))
  },
  data() {
    return {
      message: {
      content: '',
      user_id: ''
      },
      messages: [],
      messageChannel: null,
    };
  },
  created() {
    this.messageChannel = this.$cable.subscriptions.create( "MessageChannel", {
      received: (data) => {
        // this.messages.push(data)
        // this.message = ''
      },
    })
  },
  methods: {
    speak: function() {
      axios
      .post('/messages', {message: this.message})
      .then(response => {
          let msg = response.data;
          this.messages.push(msg);
        });
    }
  },
};
</script>

