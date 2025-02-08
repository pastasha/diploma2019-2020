<template>
    <div id="app">
        <nav class="container">

            <div class="nav-item">
                <router-link to="/"> <img class="logo-link" src="@/assets/logo.png"> </router-link>
            </div>

            <ul id="nav-items" class="nav-items">
                <li>
                    <router-link to="/about-author" class="nav-link"><h2> ОБ АВТОРЕ </h2></router-link>
                </li>
                <li>
                    <router-link to="/gallery" class="nav-link"><h2> ГАЛЕРЕЯ </h2></router-link>
                </li>
                <li>
                    <router-link to="/exhibitions" class="nav-link"><h2> ВЫСТАВКИ </h2></router-link>
                </li>
                <li>
                    <router-link :to = "{
                                  name: 'Feedback',
                                  params: {
                                      title: '',
                                      preview: '',
                                      picture: ''
                                  }
                                }"
                                 class="nav-link">
                        <h2> ОБРАТНАЯ СВЯЗЬ </h2></router-link>
                </li>
            </ul>

        </nav>
    </div>
</template>

<script>
    export default {
        name: "NavItems"
    }
</script>

<style>
    #nav-items{
        position: absolute;
        top: 17%;
        right: 0;
        width: 100%;
    }

    li {
        position: relative;
        display: inline-block;
        margin-left: 5%;
        list-style: none;
    }

    h2{
        color: #727474;
        font: bold 1em Yu Gothic;
    }

    .logo-link{
        width: 20%;
        height: 20%;
    }

    .container{
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        padding-left: 5%;
    }

    .nav-item{
        margin-right: 5%;
        display: inline-block;
    }

    .nav-items{
        position: absolute;
        left: 26%;
    }

    .nav-link{
        margin-left: 13%;
        margin-bottom: 5%;
        color: #939393;
        font: bold 120% Yu Gothic;
    }
</style>