<template>
<div>
<div class="col-md-10 col-md-offset-2 maindiv">
<div class="container">
    <div class="row">
        <div class="col-12">
            <!-- Start of wrapper -->
            <div v-bind:class="classname">{{alert}}</div>
<div class="row border p-2 m-0">
    <div class="col-md-10 d-flex justify-content-start">
    <p class="lead"><strong>Problem:</strong> Resource Allocation problem</p>
    </div>
    <div class="col-md-2 d-flex justify-content-end"><button class="btn btn--outlin-primary p-0">Running</button></div>
</div>

<div class="row border p-2 m-0">
<div class="col-3">
    <div class="border p-2">
<ul class="list-group mt-1 list-group-flush">
    <li class="list-group-item active"><router-link to="/oath/dashboard" class="text-white"> Functions </router-link></li>
     <li class="list-group-item text-center"><button class="btn btn-outline-primary w-100" @click="pso">PSO</button></li>
     <li class="list-group-item text-center"><button class="btn btn-outline-primary w-100" @click="cognitive">Cognitive</button></li>
     <li class="list-group-item text-center"><button class="btn btn-outline-primary w-100" @click="linear">Linear</button></li>
     <li class="list-group-item text-center"><button class="btn btn-outline-primary w-100" @click="mixedinteger">Mixed Integer</button></li>
     <li class="list-group-item text-center"><button class="btn btn-outline-primary w-100" @click="gradient">Gradient descent</button></li>
    
</ul>
    
</div>
</div>

<div class="col-9">
    <div class="border p-2">
        <!-- <p class="lead">{{message}}</p> -->
<div class="table-responsive">
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Function</th>
                <th>Objective</th>
                <th>IsOptimal?</th>
                <th>Constraints</th>
                <th>Variables</th>
                <th>Fitness</th>
            </tr>
        </thead>
        <tbody>
                    <tr>
                <td>{{psoinfo.name}}</td>
                <td>{{psoinfo.objective}}</td>
                <td>{{psoinfo.optimal}}</td>
                <td>{{psoinfo.constraints}}</td>
                <td>{{psoinfo.variables}}</td>
                <td>{{psoinfo.objStatus}}</td>
            </tr>
            <tr>
                <td>{{cognitiveinfo.name}}</td>
                <td>{{cognitiveinfo.objective}}</td>
                <td>{{cognitiveinfo.optimal}}</td>
                <td>{{cognitiveinfo.constraints}}</td>
                <td>{{cognitiveinfo.variables}}</td>
                <td>{{cognitiveinfo.objStatus}}</td>
            </tr>
            <tr>
                <td>{{linearinfo.name}}</td>
                <td>{{linearinfo.objective}}</td>
                <td>{{linearinfo.optimal}}</td>
                <td>{{linearinfo.constraints}}</td>
                <td>{{linearinfo.variables}}</td>
                <td>{{linearinfo.objStatus}}</td>
            </tr>
            <tr>
                <td>{{mixedinfo.name}}</td>
                <td>{{mixedinfo.objective}}</td>
                <td>{{mixedinfo.optimal}}</td>
                <td>{{mixedinfo.constraints}}</td>
                <td>{{mixedinfo.variables}}</td>
                <td>{{mixedinfo.objStatus}}</td>
            </tr>
                <tr>
                <td>{{gradientinfo.name}}</td>
                <td>{{gradientinfo.objective}}</td>
                <td>{{gradientinfo.optimal}}</td>
                <td>{{gradientinfo.constraints}}</td>
                <td>{{gradientinfo.variables}}</td>
                <td>{{gradientinfo.objStatus}}</td>
            </tr>
        </tbody>
    </table>
</div>

    </div>
</div>

</div>

<!-- End of wrapper -->
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
            linearinfo:'',
            mixedinfo:'',
            gradientinfo:'',
            cognitiveinfo:'',
            psoinfo:'',
            alert:null,
            progress:null,
            message:'Click Optimize button to optimize this problem',
            classname:'',
            runtime:0
        }
    },
    methods:{
        linear(){
            axios.get('/api/linear_function/', {
                onUploadProgress: uploadEvent => {
                    this.progress='Progress : '+ Math.round(uploadEvent.loaded / uploadEvent.total * 100) + "%"
                }
            }).then(response => {
                this.alert=response.data.msg
                this.classname=response.data.classname
                this.linearinfo=response.data
                console.log(response)
            }).catch((error)=>{
                this.classname='alert alert-danger p-1 text-center'
                this.alert=error

            })
        },
    mixedinteger(){
            axios.get('/api/mixed_integer/', {
                onUploadProgress: uploadEvent => {
                    this.progress='Progress : '+ Math.round(uploadEvent.loaded / uploadEvent.total * 100) + "%"
                }
            }).then(response => {
                this.alert=response.data.msg
                this.classname=response.data.classname
                this.mixedinfo=response.data
                console.log(response)
            }).catch((error)=>{
                this.classname='alert alert-danger p-1 text-center'
                this.alert=error

            })
        },
    gradient(){
            axios.get('/api/gradient/', {
                onUploadProgress: uploadEvent => {
                    this.progress='Progress : '+ Math.round(uploadEvent.loaded / uploadEvent.total * 100) + "%"
                }
            }).then(response => {
                this.alert=response.data.msg
                this.classname=response.data.classname
                this.gradientinfo=response.data
                console.log(response)
            }).catch((error)=>{
                this.classname='alert alert-danger p-1 text-center'
                this.alert=error

            })
        },

   pso(){
            axios.get('/api/pso/', {
                onUploadProgress: uploadEvent => {
                    this.progress='Progress : '+ Math.round(uploadEvent.loaded / uploadEvent.total * 100) + "%"
                }
            }).then(response => {
                this.alert=response.data.msg
                this.classname=response.data.classname
                this.psoinfo=response.data
                console.log(response)
            }).catch((error)=>{
                this.classname='alert alert-danger p-1 text-center'
                this.alert=error

            })
        },
           cognitive(){
            axios.get('/api/cognitive/', {
                onUploadProgress: uploadEvent => {
                    this.progress='Progress : '+ Math.round(uploadEvent.loaded / uploadEvent.total * 100) + "%"
                }
            }).then(response => {
                this.alert=response.data.msg
                this.classname=response.data.classname
                this.gradientinfo=response.data
                console.log(response)
            }).catch((error)=>{
                this.classname='alert alert-danger p-1 text-center'
                this.alert=error

            })
        },
    },
    //end of methods

}
</script>