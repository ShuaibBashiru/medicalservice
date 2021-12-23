<template>
  <div id="app">
    <Layout/>
    <router-view/>
  </div>
</template>

<script>
var layout=null;
import router from '@/router'
router.beforeEach((to, from, next)=>{
layout=to.meta.layout
document.title=to.meta.title
  next()
})
export default {
      components:{
    'Layout': ()=> import('./layout/'+layout+'.vue')
    }
};
</script>
<style scope>
    @import url('./assets/css/style.css');
</style>