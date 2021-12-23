<template>
<div>
<div class="container-fluid">
<div class="row border border-top-0 border-right-0 border-left-0 header">
<div class="col-md">
<nav :class="'navbar navbar-expand-lg p-1 ' + appinfo.bg_color">
<a :class="'navbar-brand '+appinfo.f_color" href="/">&nbsp; {{appinfo.appname}}</a>
<span class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
<i :class="'bi-list '+appinfo.f_color"></i>
</span>
<div class="collapse navbar-collapse" id="navbarSupportedContent">
<div style="border-top:1.5px solid #eee"></div>
<!-- <ul class="navbar-nav">
    <li class="nav-item dropdown"> <a href="#" v-bind:class="'nav-link dropdown-toggle ' + appinfo.f_color" id="dropdownlink1" role="button" data-bs-toggle="dropdown" aria-expanded="false">Browse services</a>
        <ul class="dropdown-menu" aria-labelledby="dropdownlink1">
        <li><a class="dropdown-item" href="#">Services</a></li>
        <div class="dropdown-divider"></div>
        </ul>
    </li>

    <li class="nav-item text-white"> <a v-bind:class="'nav-link ' + appinfo.f_color" href="/site/contact">Contacts</a> </li>
</ul> -->
<ul class="navbar-nav m-0 p-0 ms-auto">
    <!-- <li class="nav-item"> <a v-bind:class="'nav-link ' + appinfo.f_color" href="#">Follow us on</a> </li>
    <li class="nav-item"> <a v-bind:class="'nav-link ' + appinfo.f_color" target="_blank" v-bind:href="media.facebook"><i class="bi-facebook"></i></a> </li>
    <li class="nav-item"> <a v-bind:class="'nav-link ' + appinfo.f_color" target="_blank" v-bind:href="media.twitter"><i class="bi-twitter"></i></a> </li>
    <li class="nav-item"> <a v-bind:class="'nav-link ' + appinfo.f_color" target="_blank" v-bind:href="media.instagram"><i class="bi-instagram"></i></a> </li> -->
    <li class="nav-item"> <router-link v-bind:class="'nav-link ' + appinfo.f_color" to="/site/contact">Help(Chat)</router-link> </li>
</ul>
</div>
</nav>
</div>
</div>
</div>
<br clear="all">
<br clear="all">
<br clear="all">
<!-- Vetur can't find `tsconfig.json` or `jsconfig.json` in /home/helloworld/Develops/Web_apps/django/application. -->
</div>
</template>
<script>
import appsettings from '../json/myapp.json'
export default {
data(){
return {
"media":appsettings.media,
"appinfo":appsettings.appinfo
}
}
}
</script>
