<template>
<div>
<div class="col-md-10 col-md-offset-2 maindiv">
<div class="container">
    <div class="row">
        <div class="col-12">
            <!-- Start of wrapper -->
<div class="row border p-2 m-0">
    <div class="col-md-4 d-flex justify-content-start"><button class="btn btn-primary"><i class="bi-plus"></i> Export CSV</button></div>
    <div class="col-md-4 d-flex justify-content-center"><button class="btn btn-primary"><i class="bi-eye"></i> Preview</button></div>
    <div class="col-md-4 d-flex justify-content-end"><button class="btn btn-primary"><i class=""></i> Run and Plot</button></div>
</div>

<div class="row border p-2 m-0">
<div class="col-12">
    <h2>Coronavirus disease (COVID-19) diagnosis</h2>
    <div class="table-responsive">
        <input type="search" id="myInput" class="mt-2 mb-2" placeholder="Type to Search">
<table id="user-table" class="table table-bordered nowrap" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Country</th>
            <th>Confirmed</th>
            <th>Dead</th>
            <th>Recovered</th>
            <th>Last updated</th>
        </tr>
    </thead>
    <tbody>
        <!-- <tr v-for="(row, index) in info.data" :key="index">
            <td>{{row.location}}</td>
            <td>{{row.confirmed}}</td>
            <td>{{row.dead}}</td>
            <td>{{row.recovered}}</td>
            <td>{{row.updated}}</td>
        </tr> -->
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

</script>
<style>

</style>

<script>
import axios from 'axios';
export default{
    data(){
        return {
            info:[],
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

        }

    }
}
</script>