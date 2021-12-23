<template>
<div>
<div class="container-fluid">
<div class="row d-flex justify-content-center">
    <div class="col-md-4 border p-5 rounded mt-2">
  <form @submit.prevent="signIn" role="form">
  <div class="form-row">
<div class="form-group col">
    <h2 class="text-primary">Admin Sign in</h2>
<!-- <p>to continue to your account</p> -->
</div>
<div class="form-group col">

            <div v-bind:class="classname">{{alert}}</div>
</div>
    <div class="form-group mt-4 col">
        <label for="userid" class="text-muted">UserID</label>
        <input type="hidden" v-model="token" required>
      <input type="email" class="form-control" v-model="userid" placeholder="Enter your email" id="userid" required maxlength="100" minlength="10">
    </div>

    <div class="form-group mt-3 col">
        <label for="pwd" class="text-muted">Password</label>
      <input type="password" class="form-control" v-model="pwd" placeholder="Password" id="pwd" required maxlength="50" minlength="3">
    </div>

    <div class="form-group mt-3">
<div class="row">
  <div class="col-md-6">
    <div class="form-check">
        <input class="form-check-input" type="checkbox" id="remember">
        <label class="form-check-label" for="remember">
        Remember me
        </label>
    </div>
  </div>
  <div class="col-md-6 d-flex justify-content-end">
   <a href="oath/forgot" class="text-right">
        Forgotten password?
      </a>
  </div>
</div>
    </div>
      <div class="form-group mt-4 col">
     <button type="submit" name="signin" class="btn btn-primary form-control">Sign in</button>
    </div>
      <div class="form-group mt-5 col">
        <p class="text-center">I do not have an Account? <a href="#oath/newaccount" class="text-right">
        Contact Admin
      </a></p>
      </div>
    

  </div>
</form>


    </div>
</div>

</div>
</div>
</template>
<script>
import axios from 'axios'
export default{
data(){
  return{
            info:[],
            alert:'',
            progress:null,
            userid:null,
            pwd:'',
            classname:'',
            token:'',
            selectedFile: null
         }

},
methods:{
tokenize: function(){
             axios.get('/auth/tokenize/',{
              params:{
                'token': Math.random(9, 9999)
              }
            }
            ).then(response => {
                if(response.data.status==response.data.confirmed){
                this.token=response.data.key
                axios.defaults.headers.common['X-CSRF-TOKEN'] = response.data.key;
                }else{
                this.alert='Kindly refresh page or try again later.'
                }
              
            }).catch(()=>{
                this.classname='alert alert-danger p-1 text-center'
                this.alert='Kindly refresh page or try again later.'

            })
        },

       signIn(){
                this.alert='Please wait...'
                this.classname='alert-primary text-center p-1'
              const fd = new FormData();
              fd.append('userid', this.userid)
              fd.append('pwd', this.pwd)
              fd.append('csrfmiddlewaretoken', this.token)
              axios.post('/auth/sign_in/', fd)
              .then(response => {
                if(response.data.status==response.data.confirmed){
                this.classname=response.data.classname
                this.alert=response.data.msg
                setTimeout(function(){
                window.location.href=response.data.redirect
                },2000)
                }else{
                this.classname=response.data.classname
                this.alert=response.data.msg
                }
              
            }).catch(()=>{
                this.classname='alert alert-danger p-1 text-center'
                this.alert='Error connecting, please try again.'

            })
        },



},
// End of methods
created(){
this.tokenize()
}
}

</script>
