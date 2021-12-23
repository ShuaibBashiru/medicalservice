<template>
<div>
<div class="col-md-10 col-md-offset-2 maindiv">
<div class="container">
    <div class="row">
        <div class="col-12">
            <!-- Start of wrapper -->
<div class="row border p-2 m-0">
    <input type="file" @change="onFileSelected" class="mb-2 form-control">
    <div class="col-md-4 d-flex justify-content-start">
        <button class="btn btn-primary" @click="onUpload"><i class="bi-plus"></i> Upload CSV</button></div>
    <div class="col-md-4 d-flex justify-content-center" @click="preview"><button class="btn btn-primary"><i class="bi-eye"></i> Preview</button></div>
    <div class="col-md-4 d-flex justify-content-end" @click="sendSms"><button class="btn btn-primary"><i class=""></i> Send Sms </button></div>
</div>

<div class="row border p-2 m-0">
<div class="col-12">
    <h2>Computer Tech SMS Portal</h2>
    <div class="table-responsive">
        <input type="search" id="myInput" class="mt-2 mb-2" placeholder="Type to Search">
<table id="user-table" class="table table-bordered nowrap" cellspacing="0" width="100%">
    <!-- {{sms}} -->
    <thead>
        <tr>
            <th>Matric</th>
            <th>Surname</th>
            <th>FirstName</th>
            <th>Level</th>
            <th>Semester</th>
            <th>CGPA</th>
            <th>Phone Number</th>
        </tr>
    </thead>
    <tbody>
        <tr v-for="(d, index) in sms" :key="index">
            <td>{{d.Matric}}</td>
            <td>{{d.Surname}}</td>
            <td>{{d.FirstName}}</td>
            <td>{{d.Level}}</td>
            <td>{{d.Semester}}</td>
            <td>{{d.Cgpa}}</td>
            <td>{{d.Phone}}</td>
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
            sms:[],
            bulk:'',
            selectedFile: null
        }
    },
    methods:{
        searchApi(){
            axios.get('https://www.trackcorona.live/api/countries')
            .then((response)=>{
                this.info=response.data;
            }).catch((error)=>{
               alert("Network error occured :"+ error)
            })

        },
        onFileSelected(event){
            this.selectedFile = event.target.files[0]
        },
        onUpload(){
            const fd = new FormData();
            fd.append('image', this.selectedFile, this.selectedFile.name)
            axios.post('http://127.0.0.1:8000/upload/23/', fd, {
                onUploadProgress: uploadEvent => {
                    console.log('Uploading : '+ Math.round(uploadEvent.loaded / uploadEvent.total * 100) + "%")
                }
            })
            .then(res => {
                alert("File uploaded")
                console.log(res)
            }).catch((error)=>{
                alert("Error uploading: " + error)
            })
        },
        preview(){
            axios.get('http://127.0.0.1:8000/csv_reader/23/')
            .then((response)=>{
                this.sms=JSON.stringify(response.data);
                console.log(response.data)
            }).catch((error)=>{
               alert("Network error occured :"+ error)
            })

        },
        sendSms(){
        axios.get('http://127.0.0.1:8000/send_message/23/')
            .then((response)=>{
                console.log(response.data)
                alert(response.data)
            }).catch((error)=>{
               alert("Network error occured :"+ error)
            })
        }

    }
}
</script>