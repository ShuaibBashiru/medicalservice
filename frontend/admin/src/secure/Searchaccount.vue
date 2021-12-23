<template>
<div>
<div class="col-md-10 col-md-offset-2 maindiv">
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div  class="border p-2">
            <!-- Start of wrapper -->
<form action="">
<div class="input-group mb-3">
    <input type="text" placeholder="Enter name, email, phone" class="form-control form-control-outline-primary">
        <button class="btn btn-outline-secondary">Search</button>
</div>
</form>

<div class="row border p-2 m-0">
<div class="col-12">
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

<style>

</style>

<script>
import axios from 'axios';
export default{
    data(){
        return {
            info:[],
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
                console.log(res)
            })
        }

    }
}
</script>