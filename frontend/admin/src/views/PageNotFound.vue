
<template>
    <div>
        <br>
        <br>
        <br>
        <br>
        <br>
        <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-7 text-center"><h1>404 - Page not found !</h1>
                <p class="lead">We're sorry, we couldn't find the page you requested. but you can use other links to navigate to other pages that may be helpful. If you feel something is missing that should be here, <a href="/page/contactus">contact us</a> </p>
                <button class="btn btn-primary mt-2" @click="$router.go(-1)">Go Back</button>
                </div>
            </div>
        </div>
    </div>
</template>

