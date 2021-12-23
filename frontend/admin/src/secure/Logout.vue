<template>
<div>
<div class="col-md-12 col-md-offset-2 maindiv">
<div class="container">
    <div class="row d-flex justify-content-center">
        <div class="col-6 justify-content-center">
            <div v-bind:class="classname">{{alert}}</div>
            <!-- Start of wrapper -->
    </div>
</div>

</div>
</div>
</div>
</template>

<script>
import axios from 'axios';
export default{
    data(){
        return {
            alert:null,
            progress:null,
            classname:''
        }
    },
    methods:{
 logout(){
      this.alert='Logging out...'
                      this.classname='alert-warning text-center p-1'
            axios.get('/auth/logout/')
            .then(response => {
                if(response.data.status==response.data.confirmed){
                this.alert=response.data.msg
                this.classname=response.data.classname
                 setTimeout(function(){
                window.location.href=response.data.redirect
                },3000)
                }else{
                this.classname=response.data.classname
                this.alert=response.data.msg
                setTimeout(function(){
                window.location.href=response.data.redirect
                },3000)
                }
              
            }).catch(()=>{
                this.classname='alert alert-danger p-1 text-center'
                this.alert='Error connecting..! Refresh to continue.'

            })
        },
    },
    // end of methods
    created(){
        this.logout()
    }
}
</script>