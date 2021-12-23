<template>
    <div>
<div class="col-md-10 col-md-offset-2 mt-1 maindiv">
<div v-bind:class="classname">{{alert}}</div>
        <div class="container">
            <div class="row mt-5 d-flex justify-content-center">

                <div class="col-10">
        <h2 class="text-center">Hello! Welcome</h2>
        <p class="lead text-center text-muted mt-4">Use the left side menu for various activities on this Dashboard. For the use of this activities, read the documentation as a guide.</p>
                </div>
            </div>

        </div>
</div>
</div>
</template>


<script>

export default{
    data(){
        return{
            alert:null,
            classname:null,
        }
    }
}

</script>
<style>

</style>
