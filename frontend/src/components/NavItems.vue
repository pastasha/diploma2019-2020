<template>
    <div id="app">
        <div class="nav-item">
            <router-link to="/"> <img class="logo-link" src="@/assets/logo.png"> </router-link>
        </div>

        <div class="nav-items" id="nav-items">
            <div class="nav-item">
                <router-link to="/about-author" class="nav-link"><h2> ОБ АВТОРЕ </h2></router-link>
            </div>
            <div class="nav-item">
                <router-link to="/gallery" class="nav-link"><h2> ГАЛЕРЕЯ </h2></router-link>
            </div>
            <div class="nav-item">
                <router-link to="/exhibitions" class="nav-link"><h2> ВЫСТАВКИ </h2></router-link>
            </div>
            <div class="nav-item">
                <router-link to="/feedback" class="nav-link"><h2> ОБРАТНАЯ СВЯЗЬ </h2></router-link>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "NavItems"
    }
</script>

<style>
    .nav-item{
        margin-right: 5%;
        display: inline-block;
    }

    .nav-items{
        position: absolute;
        top: 12%;
        left: 30%;
        right: -50%;
    }

    .nav-link{
        margin-left: 13%;
        margin-bottom: 5%;
        color: #707070;
        font: bold 120% Yu Gothic;
    }
</style>