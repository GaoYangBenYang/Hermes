<script setup lang="ts">

defineProps<{ msg: string }>()

function login() {
  window.location.replace("http://localhost:8080/oidc/authorize?redirect_uri=http://localhost:8081/code_flow/oidc_op&scope=openid+profile&response_type=code&nonce=cdYrYNLv6wBHlBmZjWxvrQmmD&state=aHR0cDovL3JwLmNvbTo4MDgx&client_id=cnAuY29t");
}

</script>

<template>

  <div class="card">
    <button type="button" @click="login">{{ msg }}</button>
  </div>

</template>

<style scoped>

</style>
