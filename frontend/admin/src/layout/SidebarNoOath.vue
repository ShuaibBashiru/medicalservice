<template>
<div>
<div class="container-fluid">
<div class="row">
    <div class="col-md-12  border border-top-0 border-right-0 border-left-0 header">
                <nav class="navbar navbar-expand-lg">
            <a class="navbar-brand" href="/oath/dashboard"><img src="../assets/logo.png" alt="Dash" class="site_logo"> &nbsp; {{appinfo.appname}}</a>
            <span class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <i class="bi-list"></i>
            </span>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <div style="border-top:1.5px solid #eee"></div>
                <ul class="navbar-nav m-0 p-0">
                    <li class="nav-item dropdown"> <a href="#" class="nav-link dropdown-toggle" id="dropdownlink1" role="button" data-bs-toggle="dropdown" aria-expanded="false">Browse services</a>
                        <ul class="dropdown-menu" aria-labelledby="dropdownlink1">
                        <li><a class="dropdown-item" href="#">Menu</a></li>
                        <div class="dropdown-divider"></div>
                        <li class="nav-item"><a class="dropdown-item" href="/">Go back</a></li>
                        </ul>
                    </li>

                </ul>
                
                <ul class="navbar-nav m-0 p-0 ms-auto">
                    <li class="nav-item"> <a class="nav-link" target="_blank" href="@">Help(Chat)</a> </li>
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
      <ul class="list-group mt-4 list-group-flush">
    <li class="list-group-item active"><router-link to="/oath/dashboard" class="text-white">CEC2017 FUNCTIONS</router-link></li>
  <li class="list-group-item"><router-link class="" to="/oath/statement">Problem(s)</router-link></li>
  <li class="list-group-item"><router-link class="" to="/oath/function_one">Functions</router-link></li>
</ul>
       <!-- layer one -->
    </div>
</div>

</template>

<script>
import appsettings from '../json/myapp.json'
export default {
    data(){
        return {
            "media":appsettings.media,
            "appinfo":appsettings.appinfo,
        }
    },
}
</script>