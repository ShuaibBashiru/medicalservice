<template>
   <div>
<div class="col-md-10 col-md-offset-2 maindiv">
<div class="container">

   <div class="row">
        <div v-bind:class="classname">{{alert}}</div>
    <div class="border p-2">
<div class="row form-inline mb-3  d-flex justify-content-end">
<div class="col-md-8 mt-2 ">

</div>


<div class="col-md-4 mt-2">
<form @submit.prevent="showinvoice">
<div class="input-group">
    <input type="text" v-model="serviceid" maxlength="100" class="form-control" placeholder="Invoice number" required>
    <button type="submit" class="btn btn-primary">Search</button>
</div>
</form>
</div>

</div>
    </div>

</div>

    <div class="row d-flex justify-content-center">
        <div class="col-md-10">
       <div class="row mt-3">
                <div class="col-md-12">
<div class="table-responsive">
<div class="row p-0 m-0">
    <div class="col-md-6 mt-2">
<div class="bg-warning m-2 text-center" style="width:52px; height:52px; border-radius:50%;">
<i class="bi-plus text-white"></i>
</div>
<h4>Medical Care</h4>
<table class="table nowrap" cellspacing="0" width="100%">
<thead>
    <tr> <td>Yaba college of Technology, Yaba, lagos</td>  </tr>
    <tr> <td>Phone: 08172790181</td>  </tr>
    <tr> <td>Email: medicalcare@gmail.com</td>  </tr>
</thead>
</table>

</div>

    <div class="col-md-6 mt-2 d-flex justify-content-end">
<table class="table nowrap" cellspacing="0" width="100%">
<thead>
    <tr> <th> <big>INVOICE</big> </th>  </tr>
    <tr> <td>Date: {{dateCreated}}</td>  </tr>
    <tr> <td>Invoice No: {{serviceid}} </td>  </tr>
</thead>
</table>
</div>

</div>
</div>
</div>
</div>

<div class="row mt-3 p-0 m-0">
    <div class="col-md-12">
        <h4>Bill to:</h4>
<table class="table nowrap" cellspacing="0" width="100%">
<tbody>
        <tr> 
    <td>{{name}}</td>  
    <td>{{phone}}</td> 
    <td>{{email}}</td>
    </tr>
</tbody>
</table>
</div>

</div>

<div class="row mt-3 p-0 m-0">
    <div class="col-md-12">
        <div class="table-responsive">
<table id="searchTable" class="table table-bordered nowrap" cellspacing="0" width="100%">
  <thead class="bg-warning text-white">

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
            <td class="bg-warning text-white"><strong>Total</strong></td>
            <td class="bg-warning text-white"><strong>{{invoicesum}}</strong></td>
        </tr>
    </tbody>

</table>
</div>
    </div>

    </div>

 </div>
            

    </div>
<!-- invoice -->

</div>
</div>
</div> 
</template>
<script>
import axios from 'axios';
export default {
   data(){
        return {
            token:'',
            list_items:'',
            info:'',
            userinfo:'',
            invoiceInfo:'',
            invoicesum:'',
            dateCreated:'',
            username:null,
            email: '',
            user_email: '',
            userid: '',
            serviceid: null,
            name:'',
            phone:'',
            price:null,
            qty:null,
            list:null,
            alert:null,
            submit:'Add',
            isDisabled:false,
            error_btn: null,
            classname:' ',

        }
    },

    methods:{

           userdata: function(){
            this.classname='alert alert-warning p-1 text-center'
            this.alert='Pleast wait while processing....'
            axios.get('/api/getuserdata_invoice/', {
                params:{
                    'username': this.serviceid
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
                this.dateCreated=this.userinfo[6]
                this.user_email=this.userinfo[4]
                this.userid=this.userinfo[0]
               }else{
                this.alert=response.data.msg
                this.classname=response.data.classname
                }
               
            }).catch(()=>{
                this.classname='alert alert-danger p-1 text-center'
                this.alert='Error connecting, please try again' 

            })
        },
       
    
        getinvoice: function(){
            this.classname='alert alert-warning p-1 text-center'
            this.alert='Pleast wait....'
            axios.get('/api/getinvoicedata/',
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
     showinvoice: function(){
        this.userdata()
        this.getinvoice()
        
    }
    },
   

}
</script>