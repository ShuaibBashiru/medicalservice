<template>
<div>
<div class="col-md-10 col-md-offset-2 maindiv">
<div class="col m-2 mt-0 mb-1"><div v-bind:class="classname">{{alert}}</div></div>
<div class="container">
<div class="row">
<div class="col-md-4">
<div class="p-1 pb-0 ml-0 pl-0">
    <h5 class="mt-2"><i class="bi-person-plus" style="font-size: 1.5rem;"></i> User's Account {{this.$route}} </h5>
</div>
</div>
<div class="col-md-8 p-0 d-flex justify-content-end">
<div class="btn-toolbar m-1" role="toolbar" aria-label="Toolbar with button groups">
<div class="btn-group m-2" role="group" aria-label="First group"><router-link to="/oath/user" class="btn btn-primary text-center">  <i class="bi-person-circle"></i> New Account </router-link></div>
<div class="btn-group m-2" role="group" aria-label="First group"><a href="/oath/user" class="btn btn-outline-secondary text-center">  <i class="bi-arrow-clockwise"></i> Refresh </a></div>
</div>

</div>
</div>
</div>
<div class="container">
<div class="border">
<div class="row">
            <div class="col-md-4">
    <div class="p-2">
            <fieldset class="border p-2">
                <legend class="w-auto" style="float: none; padding: inherit;">Instruction</legend>

            <div class="row">
    
            <div class="col-md-12">
                <div class="m-1 mt-2">

                    <div class="alert alert-warning"><p class="">
                        Kindly provide valid information only. The user Email and Phone number will be used 
                        for subsequent communication. Hence, A default password will be sent to the Email provided for secuirty purpose, 
                        which the user can later used to login or change password to your desired password. If you are facing any difficulty creating this account, kindly contact the administrator.
                        </p></div>

                </div>
            </div>


            </div>
            </fieldset>

    </div>
</div>
<div class="col-md-8">
    <div class="p-2">
            <form @submit.prevent="formCheck" metho="post" class="needs-validation">
            <fieldset class="border p-2">
                <legend class="w-auto" style="float: none; padding: inherit;">Account</legend>
            <div class="row">
            <div class="col-md-6">
                <div class="m-1 mt-2">
                    <label for="sname" class="pb-1 text-dark">Surname</label>
                <div class="input-group">
                        <input type="hidden" class="d-none" v-model="token" required>
                    <button type="button" class="btn btn-outline-info"><i class="bi-person"></i></button>
                    <input type="text" v-model="surname" :disabled="isDisabled" id="sname" minlength="3" maxlength="50" class="form-control" required placeholder="Surname/Lastname">
                </div>
                <small class="form-text text-muted"></small>
                <small class="text-danger">{{err_surname}}</small>
                
                </div>
            </div>

            <div class="col-md-6">
                <div class="m-1 mt-2">
                    <label for="fname" class="pb-1 text-dark">Firstname</label>
                <div class="input-group">
                    <button type="button" class="btn btn-outline-info"><i class="bi-person"></i></button>
                    <input type="text" v-model="firstname" :disabled="isDisabled" minlength="3" maxlength="50" id="fname" class="form-control" required placeholder="Firstname">
                </div>
                <small class="form-text text-muted"></small>
                    <small class="text-danger">{{err_firstname}}</small>
                
                </div>
            </div>

            <div class="col-md-6">
                <div class="m-1 mt-2">
                    <label for="oname" class="pb-1 text-dark">Othername</label>
                <div class="input-group">
                    <button type="button" class="btn btn-outline-info"><i class="bi-person"></i></button>
                    <input type="text" v-model="othername" :disabled="isDisabled" id="oname" maxlength="50" class="form-control" placeholder="Othername (Optional)">
                </div>
                <small class="form-text text-muted"></small>
                    <small class="text-danger">{{err_othername}}</small>
                </div>
            </div>

            <div class="col-md-6">
                <div class="m-1 mt-2">
                    <label for="email" class="pb-1 text-dark">Email</label>
                <div class="input-group">
                    <button type="button" class="btn btn-outline-info"><i class="bi-mailbox"></i></button>
                    <input type="email" v-model="email" :disabled="isDisabled" minlength="10" maxlength="100" id="email" class="form-control" required placeholder="Email address">
                </div>
                    <small class="form-text text-muted"></small>
                    <small class="text-danger">{{err_email}}</small>
                </div>
            </div>


            <div class="col-md-6">
                <div class="m-1 mt-2">
                <div class="row">
                    <div class="col-5">
                    <label for="code" class="pb-1 text-dark">Country code</label>
                <div class="input-group">
                    <button type="button" class="btn btn-outline-info"><i class="bi-telephone"></i></button>
                    <select class="form-select p-0" v-model="countryCode" :disabled="isDisabled" id="code" required>
                    <option value="+234">+234</option>
                    </select>
                    </div>
                    </div>
                <div class="col-7">
                    <label for="phone" class="pb-1 text-dark">Phone</label>
                <div class="input-group">
                    <input type="text" v-model="phone" :disabled="isDisabled" minlength="7" maxlength="15" id="phone" class="form-control" required placeholder="Number only">
                    </div>
                </div>
                    </div>
                    <small class="form-text text-muted"></small>
                    <small class="text-danger">{{err_phone}}</small>
            
                </div>
            </div>


            <div class="col-md-6">
                <div class="m-1 mt-2">
                    <label for="persionalId" class="pb-1 text-dark">Personal ID</label>
                <div class="input-group">
                    <button type="button" class="btn btn-outline-info"><i class="bi-file-person"></i></button>
                    <input type="text" v-model="persionalId" :disabled="isDisabled" maxlength="100" id="persionalId" class="form-control" placeholder="ID (Optional)">
                </div>
                <small class="text-muted">This can be used to create a personal identity</small>
                    <small class="text-danger">{{err_persionalId}}</small>
                </div>
            </div>

            <div class="col-md-6">
                <div class="m-1 mt-2">
                    <label for="account_type" class="pb-1 text-dark">Account Type</label>
                <div class="input-group">
                    <button type="button" class="btn btn-outline-info"><i class="bi-question-circle"></i></button>
                    <select class="form-select" v-model="account_type" :disabled="isDisabled" id="account_type" required>
                        <option value="3">User/Member/Clients</option>
                    </select>
                </div>
                <small class="form-text text-muted"></small>
                    <small class="text-danger">{{err_account_type}}</small>
                </div>
            </div>

            <div class="col-md-6 text-center">
                <div class="m-1 mt-2">
                    <label for=""></label>
                <div class="input-group">
                    <button type="submit" :disabled="isDisabled" class="btn btn-primary form-control">{{submit}}</button>
                </div>
                </div>
                    <small class="pb-2 text-danger text-center">{{error_btn}}</small>

            </div>


            
                </div>
                </fieldset>
            </form>
        
    </div>
</div>

</div>
</div>
</div>


</div>
</div>
</template>
<script>
import axios from 'axios'
export default {
//   components:{
// 'Menu': ()=> import('../layout/accountHeader.vue')
// },
    data (){
        return{
        alert:null,
        token: null,
        surname: null,
        firstname: null,
        othername: null,
        email: null,
        persionalId: null,
        phone: null,
        countryCode: null,
        account_type: null,
        err_surname: null,
        err_firstname: null,
        err_othername: null,
        err_email: null,
        err_phone: null,
        err_account_type: null,
        err_persionalId: null,
        selectDefault:"Select",
        classname:null,
        submit:'Submit',
        isDisabled:false,
        error_btn: null,
    }
    },
    created(){
    this.tokenize()
    },
    methods:{
    validEmail: function (email) {
    var re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
    },
    validDigit: function (digits) {
    var re = /^\d+$/;
    return re.test(digits);
    },
    formCheck: function(e){
        if (!this.validEmail(this.email)) {
        this.err_email="Valid email required.";
        this.error_btn="Go back and check error message";
        }else if(!this.validDigit(this.phone)){
        this.err_phone="Valid phone number required.";
        this.error_btn="Please check and correct error(s)";
        }else{
            this.err_email=""
            this.err_phone=""
            this.error_btn="";
        this.submit="Please wait.."
        this.adminAccount()
        }
    e.preventDefault();
    },
    adminAccount: function(){
    const form = new FormData();
        form.append('surname', this.surname)
        form.append('firstname', this.firstname)
        form.append('othername', this.othername)
        form.append('email', this.email)
        form.append('phone', this.phone)
        form.append('countryCode', this.countryCode)
        form.append('persionalId', this.persionalId)
        form.append('account_type', this.account_type)
        form.append('csrfmiddlewaretoken', this.token)
    axios.post('/auth/adminaccount/', form)
        .then(response => {
        if(response.data.status==response.data.confirmed){
        this.classname=response.data.classname
        this.alert=response.data.msg
        this.submit="Submit"
        }else{
        this.classname=response.data.classname
        this.alert=response.data.msg
        this.submit="Submit"
        }
        
    }).catch(()=>{
        this.classname='alert alert-danger p-1 text-center'
        this.alert='Error connecting.., try again.'
        this.submit="Submit"
    })  
    },
    tokenize: function(){
    const form = new FormData();
    form.append('token', Math.random(9,99999))
    axios.get('/auth/tokenize/',form, {
    }).then(response => {
        if(response.data.status==response.data.confirmed){
        this.token=response.data.key
        axios.defaults.headers.common['X-CSRF-TOKEN'] = response.data.key;
        }else{
        this.alert='Kindly refresh or try again later.'
        }
        
    }).catch(()=>{
        this.classname='alert alert-danger p-1 text-center'
        this.alert='Kindly refresh or try again later.'

    })
    },


    },


    }
</script>