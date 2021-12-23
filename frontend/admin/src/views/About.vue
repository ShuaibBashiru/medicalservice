<template>
    <div>
        <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-md-8 m-auto p-5 col-md-offset-2 maindiv">

<h2>Resource Allocation Problem</h2>
    <!-- {{this.$router.currentRoute}} -->

<p>Say that a factory produces four different products, and that the daily produced amount of the first product is <em>x</em>₁, the amount produced of the second product is <em>x</em>₂, and so on. The goal is to determine the profit-maximizing daily production amount for each product, bearing in mind the following conditions:</p>
<ol>
<li>
<p>The profit per unit of product is $20, $12, $40, and $25 for the first, second, third, and fourth product, respectively.</p>
</li>
<li>
<p>Due to manpower constraints, the total number of units produced per day can&rsquo;t exceed fifty.</p>
</li>
<li>
<p>For each unit of the first product, three units of the raw material A are consumed. Each unit of the second product requires two units of the raw material A and one unit of the raw material B. Each unit of the third product needs one unit of A and two units of B. Finally, each unit of the fourth product requires three units of B.</p>
</li>
<li>
<p>Due to the transportation and storage constraints, the factory can consume up to one hundred units of the raw material A and ninety units of B per day.</p>
</li>
</ol>
<p>The mathematical model can be defined like this:</p>
<figure><a href="https://files.realpython.com/media/lp-py-eq-4.0178c4cfe357.png" target="_blank" rel="noopener"><img class="img-fluid mx-auto d-block w-50" src="https://files.realpython.com/media/lp-py-eq-4.0178c4cfe357.png" sizes="75vw" srcset="https://robocrop.realpython.net/?url=https%3A//files.realpython.com/media/lp-py-eq-4.0178c4cfe357.png&amp;w=185&amp;sig=a608e61e6f46ce776599768b104c7188ca847ba5 185w, https://robocrop.realpython.net/?url=https%3A//files.realpython.com/media/lp-py-eq-4.0178c4cfe357.png&amp;w=370&amp;sig=ef42be346a3357a0c75194292b183bddb56435e6 370w, https://files.realpython.com/media/lp-py-eq-4.0178c4cfe357.png 740w" alt="mmst-lp-py-eq-4" width="740" height="357" data-asset="2498" /></a></figure>
<p>The objective function (profit) is defined in condition 1. The manpower constraint follows from condition 2. The constraints on the raw materials A and B can be derived from conditions 3 and 4 by summing the raw material requirements for each product.</p>
<!-- end -->
                </div>
            </div>

        </div>
</div>
</template>

<script>

</script>
<style>

</style>
