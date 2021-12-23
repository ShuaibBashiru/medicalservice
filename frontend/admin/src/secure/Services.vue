<template>
<div>
<div class="col-md-10 col-md-offset-2 maindiv">
<div class="container">
    <div class="row">
        <div v-bind:class="classname">{{alert}}</div>
    <div class="border p-2">
<div class="row form-inline mb-3  d-flex justify-content-end">
<div class="col-md-4 mt-2 ">
<form @submit.prevent="userdata">
<div class="input-group">
    <input type="text" v-model="username" maxlength="100" class="form-control" placeholder="Patient ID (Email)" required>
    <button type="submit" class="btn btn-primary">Search</button>
</div>
</form>
</div>


<div class="col-md-8 mt-2">
<div class="input-group justify-content-end">
 <a :href="'/oath/invoice/' + serviceid"><button class="btn btn-primary m-1 mb-0">Generate Invoice</button></a>
 <button class="btn btn-secondary m-1 mb-0" onClick="window.location.reload()"><i class="bi-arrow-clockwise"></i> Refresh</button>
</div>
</div>

</div>
    </div>


</div>
<div class="row mt-2">
<div class="col-md-12 p-0">
    <div class="row">


        <div class="col-md-4">
         <p class="lead p-0 m-0 ps-2 bg-danger text-white">Patient Details</p>
         <div class="row">
             <!-- <div class="col-5">
                 <div class="border bg-secondary" style="width:100%; height:130px;">
                     <img src="../assets/passport/avatar.png" alt="" style="width:100%; height:130px;">
                 </div>
             </div> -->
             <div class="col-md-12">
                  <div class="">
                      <ul class="list-group m-0 p-0">
                          <li class="list-group-item p-1">{{name}}</li>
                          <li class="list-group-item p-1">{{phone}}</li>
                          <li class="list-group-item p-1">{{email}}</li>
                          <li class="list-group-item p-1">{{gender}}</li>
                          <li class="list-group-item p-1">{{age}}</li>
                      </ul>
                  </div>
             </div>
         </div>
        </div>


        <div class="col-md-8 border-start">
           <p class="lead p-0 m-0 ps-2 bg-danger text-white">Services <span class="float-end pe-2"> Invoice ID: {{serviceid}}</span></p>
           <form @submit.prevent="addservice" class="needs-validation">
            <fieldset class="border p-2">
                <!-- <legend class="w-auto" style="float: none; padding: inherit;">Service</legend> -->
            <div class="row">
                <div class="col-md-12">
             <div class="input-group justify-content-end">
                    <input type="hidden" class="form-control" v-model="token" required>
                    <input type="hidden" class="form-control" v-model="serviceid" required>
                    <input type="hidden" class="form-control" v-model="userid" required>
                    <input type="hidden" class="form-control" v-model="user_email" required>
                    </div>
                </div>
           <div class="col-6">
                <div class="m-1 mt-2">
                    <label for="list" class="pb-1 text-dark">Drug List</label>
                <div class="input-group">
                    <button type="button" class="btn btn-outline-info"><i class="bi-list"></i></button>
                    <select class="form-select p-0" v-model="list" required @change="checklist">
                    <option v-for="(d, index) in list_items" :key="index" :value="d[0]">
                       {{d[2] + " (" + d[3] +" -- "+ d[4]+") "}}
                    </option>
                    </select>
                    </div>
                    </div>
                    </div>

            <div class="col-md-6">

                <div class="m-1 mt-2">
                    <label for="price" class="pb-1 text-dark">Enter price</label>
                <div class="input-group">
                    <button type="button" class="btn btn-outline-info"><i class="bi-list"></i></button>
                    <input type="text" v-model="price" id="price" maxlength="20" class="form-control" required placeholder="Enter price">
                </div>
                <small class="form-text text-muted"></small>
                <small class="text-danger"></small>
                </div>
            </div>

            <div class="col-md-6">
                <div class="m-1 mt-2">
                    <label for="qty" class="pb-1 text-dark">Quantity</label>
                <div class="input-group">
                    <button type="button" class="btn btn-outline-info"><i class="bi-list"></i></button>
                    <input type="text" v-model="qty" id="qty" maxlength="20" class="form-control" required placeholder="Quantity">
                </div>
                <small class="form-text text-muted"></small>
                <small class="text-danger"></small>
                </div>
            </div>

                 <div class="col-md-6 text-center">
                <div class="m-1 mt-2">
                    <label for=""></label>
                <div class="input-group">
                    <button type="submit" class="btn btn-primary form-control">{{submit}}</button>
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

<div class="row mt-3 p-0 m-0">
    <div class="col-md-12">
        <div class="table-responsive">
<table id="searchTable" class="table table-bordered nowrap" cellspacing="0" width="100%">
  <thead class="bg-danger text-white">

        <tr>
            <th>S/N</th>
            <th>Service</th>
            <th>Qty</th>
            <th>Unit Price</th>
            <th>Amount</th>
        </tr>
    </thead>
    <tbody>
        <tr v-for="(d, index) in invoiceInfo" :key="index">
            <td>{{index + 1}}</td>
            <td>{{d[0]}}</td>
            <td>{{d[1]}}</td>
            <td>{{d[2]}}</td>
            <td>{{d[3]}}</td>
        </tr>
 
            <tr>
            <td colspan="3"></td>
            <td class="bg-danger text-white"><strong>Total</strong></td>
            <td class="bg-danger text-white"><strong>{{invoicesum}}</strong></td>
        </tr>
    </tbody>

</table>
</div>
    </div>

    </div>




</div>
</div>
</div>
</template>
<style scoped>
.col-4 h3{
    font-size: 16px;
}
</style>
<script>
import axios from 'axios';
export default{
    data(){
        return {
            token:'',
            list_items:'',
            info:'',
            userinfo:'',
            invoiceInfo:'',
            invoicesum:'',
            username:'',
            email: '',
            user_email: '',
            userid: '',
            serviceid: '',
            item_id: '',
            name:'',
            phone:'',
            gender:'',
            age:'',
            price:'',
            qty:'',
            list:'',
            alert:'',
            submit:'Add',
            isDisabled:false,
            error_btn: '',
            classname:' ',

        }
    },
    methods:{

           userdata(){
            this.classname='alert alert-warning p-1 text-center'
            this.alert='Pleast wait while processing....'
            axios.get('/api/get_user_data/', {
                params:{
                    'username': this.username
                }
            }
                ).then(response => {
                if(response.data.status == response.data.confirmed){
                this.alert=''
                this.classname=''
                this.userinfo = response.data.result
                this.name='Name: ' + this.userinfo[1] + ' ' + this.userinfo[2]
                this.email='Email: ' + this.userinfo[4]
                this.phone='Phone: ' + this.userinfo[5]
                this.gender='Gender: ' + this.userinfo[6]
                this.age='Age: ' + this.userinfo[7]
                this.user_email=this.userinfo[4]
                this.userid=this.userinfo[0]
                this.serviceid=response.data.serviceid
               }else{
                this.alert=response.data.msg
                this.classname=response.data.classname
                }
               
            }).catch(()=>{
                this.classname='alert alert-danger p-1 text-center'
                this.alert='Error connecting, please try again' 

            })
        },
       

    checklist: function(){
            this.classname='alert alert-warning p-1 text-center'
            this.alert='Pleast wait....'
            axios.get('/api/get_available/', {
                params:{
                    item_id: this.list
                }
            })
            .then(response => {
            if(response.data.status == response.data.confirmed){
                this.alert=''
                this.classname=''
            }else{
                this.alert=response.data.msg
                this.classname=response.data.classname
                }
            }).catch((error)=>{
                this.classname='alert alert-danger p-1 text-center'
                this.alert=error

            })
        },

        showlist: function(){
            this.classname='alert alert-warning p-1 text-center'
            this.alert='Pleast wait....'
            axios.get('/api/get_drug_list/')
            .then(response => {
            if(response.data.status == response.data.confirmed){
                this.alert=''
                this.classname=''
                this.list_items = response.data.result
            }else{
                this.alert=response.data.msg
                this.classname=response.data.classname
                }
            }).catch((error)=>{
                this.classname='alert alert-danger p-1 text-center'
                this.alert=error

            })
        },
        addservice(){
        const form = new FormData();
        form.append('price', this.price)
        form.append('listid', this.list)
        form.append('qty', this.qty)
        form.append('serviceid', this.serviceid)
        form.append('userid', this.userid)
        form.append('useremail', this.user_email)
        form.append('csrfmiddlewaretoken', this.token)
        axios.post('/auth/addservice/', form)
        .then(response => {
        if(response.data.status==response.data.confirmed){
        this.classname=response.data.classname
        this.alert=response.data.msg
        this.submit="Add"
        this.getinvoice()
        }else{
        this.classname=response.data.classname
        this.alert=response.data.msg
        this.submit="Add"
        }
        
    }).catch(()=>{
        this.classname='alert alert-danger p-1 text-center'
        this.alert='Error connecting, please try again.'
        this.submit="Add"
    })  

        },

        getinvoice: function(){
            this.classname='alert alert-warning p-1 text-center'
            this.alert='Pleast wait....'
            axios.get('/api/getinvoice/',
            {
                params:{
                    'serviceid':this.serviceid
                }
            })
            .then(response => {
            if(response.data.status == response.data.confirmed){
                this.alert=''
                this.classname=''
                this.invoiceInfo = response.data.result
                this.invoicesum = response.data.sum
            }else{
                this.alert=response.data.msg
                this.classname=response.data.classname
                }
            }).catch((error)=>{
                this.classname='alert alert-danger p-1 text-center'
                this.alert=error

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
        this.alert='Error connecting, please try again.'

    })
    },

    },
    created(){
        this.showlist()
        this.tokenize()
    }
    //end of methods

}
</script>