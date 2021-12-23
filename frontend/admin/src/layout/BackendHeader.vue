<template>
<div>
<div class="container-fluid">
<div class="row border border-top-0 border-right-0 border-left-0 header">
<div class="col-md">
<nav :class="'navbar navbar-expand-lg p-1 ' + appinfo.bg_color">
<a :class="'navbar-brand '+appinfo.f_color" href="/"><img :src="require('@/assets/logo.png')" :width="appinfo.logoWidth" :height="appinfo.logoHeight"  alt="" class=""> &nbsp; {{appinfo.appname}}</a>
<span class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
<i :class="'bi-list '+appinfo.f_color"></i>
</span>
<div class="collapse navbar-collapse" id="navbarSupportedContent">
<div style="border-top:1.5px solid #eee"></div>
<ul class="navbar-nav">
    <li class="nav-item dropdown"> <a href="#" v-bind:class="'nav-link dropdown-toggle ' + appinfo.f_color" id="dropdownlink1" role="button" data-bs-toggle="dropdown" aria-expanded="false">Browse services</a>
        <ul class="dropdown-menu" aria-labelledby="dropdownlink1">
        <li><a class="dropdown-item" href="#">Services</a></li>
        <div class="dropdown-divider"></div>
        <li class="nav-item p-2">No services yet</li>
        </ul>
    </li>
</ul>
<ul class="navbar-nav ms-auto m-3 mt-0 mb-0">
    <li class="nav-item p-1 pt-0 pb-0"> <a v-bind:class="'nav-link ' + appinfo.f_color" href="/site/logout">Sign Out</a> </li>
    <li class="nav-item p-1 pt-0 pb-0"> <router-link v-bind:class="'nav-link ' + appinfo.f_color" to="/site/contact">{{surname}} {{firstname}}</router-link> </li>
    <li class="nav-item p-1 pt-0 pb-0"><div class="dp"></div></li>
</ul>
</div>
</nav>
</div>
</div>

</div>
    <div class="col-md-2 sidebar p-1 border border-top-0 border-bottom-0 border-right-0">
       <div class="input-group sticky-top">
           <input type="search" class="form-control" id="search-input" placeholder="Search menu" aria-label="Search for..." autocomplete="off">
       </div>
      <ul class="list-group mt-4 pl-0 m-0 list-group-flush">
       <li class="list-group-item active"><router-link to="/oath/dashboard" class="text-white">Menu</router-link></li>
    <section class="section_one" v-if="role==1">
        <li class="list-group-item"><router-link class="" to="/oath/uploadpayment"><i class="bi-upload"></i> Payments </router-link></li>
  <li class="list-group-item"><router-link class="" to="/oath/adminaccount"><i class="bi-person"></i> Admins</router-link></li>
 <li class="list-group-item"><router-link class="" to="/oath/useraccount"><i class="bi-person"></i> Patients </router-link></li>
  <li class="list-group-item"><router-link class="" to="/oath/services"><i class="bi-upload"></i> Services </router-link></li>
  <li class="list-group-item"><router-link class="" to="/oath/invoices"><i class="bi-lock"></i> Invoices </router-link></li>
  <li class="list-group-item"><router-link class="" to="/oath/invoice/23"><i class="bi-printer"></i> Print Invoice </router-link></li>
  <li class="list-group-item"><router-link class="" to="/oath/flagged"><i class="bi-lock"></i> Flagged </router-link></li>
    </section>
<section v-else>

 <li class="list-group-item"><router-link class="" to="/oath/useraccount"><i class="bi-person"></i> Patients </router-link></li>
  <li class="list-group-item"><router-link class="" to="/oath/services"><i class="bi-upload"></i> Services </router-link></li>
  <li class="list-group-item"><router-link class="" to="/oath/invoices"><i class="bi-lock"></i> Invoices </router-link></li>
  <li class="list-group-item"><router-link class="" to="/oath/invoice/23"><i class="bi-printer"></i> Print Invoice </router-link></li>
</section>
</ul>
       <!-- layer one -->
    </div>
</div>

</template>
<style scoped>
.dp{
    border-radius:50%;
    width: 32px;
    height: 32px;
    border:1px solid #eee;
    background-image: url('../assets/passport/avatar.png');
    background-size: 32px 32px;
}
.dp img{
    border-radius:50%;
    width: 32px;
    height: 32px;
}
</style>
<script>
import appsettings from '../json/myapp.json'
import axios from 'axios'
export default {
    data(){
        return {
            "media":appsettings.media,
            "appinfo":appsettings.appinfo,
            alert:null,
            surname:null,
            firstname:null,
            role:null,
            email:null,
            progress:null,
            userid:null,
            pwd:'',
            classname:'',
        }
    },
    methods:{
    auth_check: function(){
            axios.get('/auth/auth_check/', {
                onUploadProgress: uploadEvent => {
                    this.progress='Progress : '+ Math.round(uploadEvent.loaded / uploadEvent.total * 100) + "%"
                this.alert='Please wait...'
                this.classname='alert-primary text-center p-1'

               }
            })

            .then(response => {
                if(response.data.status==response.data.confirmed){
                this.classname=response.data.classname
                this.surname=response.data.surname
                this.firstname=response.data.firstname
                this.email=response.data.email
                this.role=response.data.role
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
    mounted(){
        this.auth_check()
    }
}
</script>