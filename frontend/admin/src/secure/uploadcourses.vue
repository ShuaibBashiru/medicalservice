<template>
<div>
<div class="col-md-10 col-md-offset-2 maindiv">
<div class="container">
    <div class="row">
        <div class="col-12">
            <!-- Start of wrapper -->
            <div v-bind:class="classname">{{alert}}</div>
<div class="row border p-2 m-0">
    <input type="file" @change="onFileSelected" class="mb-2 form-control">
    <div class="col-md-4 d-flex justify-content-start">
    <button class="btn btn-primary" @click="onUpload"><i class="bi-plus"></i> Upload CSV</button></div>
    <div class="col-md-4 d-flex justify-content-center"><button class="btn btn-default"><i class=""></i>{{progress}} </button></div>
    <div class="col-md-4 d-flex justify-content-end" @click="preview"><button class="btn btn-primary"><i class="bi-eye"></i> Preview</button></div>
</div>

<div class="row border p-2 m-0">
<div class="col-12">
    <h2>Upload Courses</h2>
    <div class="table-responsive">
        <input type="search" id="myInput" class="mt-2 mb-2" placeholder="Type to Search">
<table id="user-table" class="table table-bordered nowrap" cellspacing="0" width="100%">
    <!-- {{sms}} -->
    <thead>
        <tr>
            <th>Matric</th>
            <th>Name</th>
            <th>Program</th>
            <th>Level</th>
            <th>Semester</th>
            <th>CourseCode</th>
            <th>CourseTitle</th>
            <th>CourseUnit</th>

        </tr>
    </thead>
    <tbody>
        <tr v-for="(d, index) in biodata" :key="index">
            <td>{{d[1]}}</td>
            <td>{{d[2]}} {{d[3]}} {{d[4]}}</td>
            <td>{{d[5]}}</td>
            <td>{{d[8]}}</td>
            <td>{{d[9]}}</td>
            <td>{{d[11]}}</td>
            <td>{{d[12]}}</td>
            <td>{{d[13]}}</td>
        </tr>
    </tbody>

</table>


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
            info:[],
            alert:null,
            progress:null,
            biodata:null,
            bulk:'',
            classname:'',
            selectedFile: null
        }
    },
    methods:{
        onFileSelected(event){
            this.selectedFile = event.target.files[0]
        },
        onUpload(){
            const fd = new FormData();
            fd.append('image', this.selectedFile, this.selectedFile.name)
            axios.post('http://127.0.0.1:8000/faceRecognition/uploadcourses/23/', fd, {

                onUploadProgress: uploadEvent => {
                    this.progress='Progress : '+ Math.round(uploadEvent.loaded / uploadEvent.total * 100) + "%"
                }
            })

            .then(response => {
                this.alert=response.data.msg
                this.classname=response.data.classname
                console.log(response)
            }).catch((error)=>{
                this.classname='alert alert-danger p-1 text-center'
                this.alert="Error: " + error

            })
        },
        preview(){
            axios.get('http://127.0.0.1:8000/faceRecognition/courses/23/',{
                onUploadProgress: uploadEvent => {
                    this.progress='Progress : '+ Math.round(uploadEvent.loaded / uploadEvent.total * 100) + "%"
                }
            })

            .then(response => {
                this.alert=response.data.msg
                this.classname=response.data.classname
                this.biodata=response.data.row
                console.log(response)
            }).catch((error)=>{
                this.classname='alert alert-danger p-1 text-center'
                this.alert="Error: " + error

            })
        },


    }
}
</script>