<template>
    <div id="app">
        <div class="nav-item">
            <router-link to="/" class="nav-link"> <img src="@/assets/logo.png" width="300" height="300"> </router-link>
        </div>
        <div class="nav-item">
            <router-link to="/about-author" class="nav-link"> ОБ АВТОРЕ </router-link>
        </div>
        <div class="nav-item">
            <router-link to="/gallery" class="nav-link"> ГАЛЕРЕЯ </router-link>
        </div>
        <div class="nav-item">
            <router-link to="/exhibitions" class="nav-link"> ВЫСТАВКИ </router-link>
        </div>
        <div class="nav-item">
            <router-link to="/feedback" class="nav-link"> ОБРАТНАЯ СВЯЗЬ </router-link>
        </div>

        <router-view></router-view>
    </div>
</template>

<script>
export default {
    data(){
        return{
        }
    }
}
</script>

<style>
    @import url(https://fonts.googleapis.com/css?family=Eczar);
    @import url(https://fonts.googleapis.com/css?family=Work+Sans);
    body {
        font-family: "Work Sans", "Segoe UI", "Helvetica Neue", sans-serif;
    }
    h1, h2, h3, h4, h5, h6 {
        font-family: "Eczar", sans-serif;
    }
</style>