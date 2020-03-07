<template>

    <div id="app">
        <div class="big-body">

            <div class="nav-item">
                <router-link to="/"> <img class="logo-link" src="@/assets/logo.png"> </router-link>
            </div>

            <div class="nav-items">
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

            <router-view></router-view>

            <div class="side-panel-with-links">

                <div class="menu-with-side-panel">
                    <div class="side-panel" v-if="state === 'pressed'">
                        <div class="side-panel-links">

                            <div class="open-menu">
                                <h2 class="open-menu-label">меню</h2>
                                <img class="close-menu" v-on:click="state = 'not pressed'" src="@/assets/close-img.png" height="32px" width="38px">
                            </div>

                            <div class="s-p-item">
                                <router-link to="/about-author"><p class="s-p-link"> ОБ АВТОРЕ </p></router-link>
                            </div>
                            <div class="s-p-item">
                                <router-link to="/gallery"><p class="s-p-link"> ГАЛЕРЕЯ </p></router-link>
                            </div>
                            <div class="s-p-item">
                                <router-link to="/exhibitions"><p class="s-p-link"> ВЫСТАВКИ </p></router-link>
                            </div>
                            <div class="s-p-item">
                                <router-link to="/theses"><p class="s-p-link">ДИПЛОМНЫЕ РАБОТЫ</p></router-link>
                            </div>
                            <div class="s-p-item">
                                <router-link to="/press"><p class="s-p-link">ПРЕССА</p></router-link>
                            </div>
                            <div class="s-p-item">
                                <router-link to="/methodical-works"><h2 class="s-p-link">МЕТОДИЧЕСКИЕ РАБОТЫ</h2></router-link>
                            </div>
                            <div class="s-p-item">
                                <router-link to="/feedback"><p class="s-p-link">ОБРАТНАЯ СВЯЗЬ</p></router-link>
                            </div>

                            <div class="d-s-p-info">
                                <h2 class="s-p-info"><br>Телефон:<br>+380996477383</h2>
                                <h2 class="s-p-info">Email:<br>papastasha@gmail.com<br>polinicus@gmail.com</h2>
                            </div>

                            <h2 class="developer">2019@<a href="https://github.com/pastasha">MERPH</a></h2>
                        </div>
                    </div>

                    <div class="links-and-menu">
                        <div class="links">
                            <a class="link" href="">
                                <img class="link-img" src="@/assets/telegram_logo.png">
                            </a>
                            <a class="link" href="">
                                <img class="link-img" src="@/assets/instagram_logo.png">
                            </a>
                            <a class="link" href="https://www.facebook.com/profile.php?id=100001281610367&fref=profile_friend_list&hc_location=friends_tab">
                                <img class="link-img" src="@/assets/facebook_logo.png">
                            </a>
                        </div>


                        <div class="m" v-if="state === 'not pressed'"></div>
                        <div class="menu" v-if="state === 'not pressed'">
                            <h2 class="menu-label">меню</h2>
                            <img class="menu-img" v-on:click="state = 'pressed'" v-if="state === 'not pressed'" src="@/assets/menu-img.png" height="45px" width="45px">
                        </div>


                    </div>
                </div>
            </div>



        </div>
    </div>

</template>

<script>

    export default {
        data() {
            return {
                state: 'not pressed',
            }
        },
        methods:{
            show_menu: function () {
                alert('hi')
            }
        }
    }

</script>

<style>
    .big-body{
        position: absolute;
        top: 0;
        left: 5%;
        right: 0;
        bottom: 0;
    }

    .nav-items{
        position: absolute;
        top: 12%;
        left: 30%;
        right: -50%;
    }

    .nav-item{
        margin-right: 5%;
        display: inline-block;
    }

    .nav-link{
        margin-left: 13%;
        margin-bottom: 5%;
        color: #707070;
        font: bold 120% Yu Gothic;
    }

    .link-img{
        width: 30px;
        height: 30px;
        margin-right: 10%;
    }

    .logo-link{
        width: 25%;
        height: 25%;
    }

    h2{
        color: #707070;
        font: bold 125% Yu Gothic;
    }

    .links{
        position: absolute;
        top: 2.5%;
        left: -45%;
    }

    .link{
        display: inline-block;
        margin-right: 15px;
    }

    .menu{
        position: absolute;
        top: 0;
        left: 10%;
        height: 7%;
        display: inline-block;
        //margin-bottom: 10%;
        background: #F1F1F1;
        border: none;
        box-shadow: 0 0 0;
    }

    .m{
        background: #F1F1F1;
        position: absolute;
        top: 0;
        right: 0;
        height: 8%;
        width: 90%;
    }

    .open-menu{
        position: absolute;
        right: 40%;
        top: -11.5%;
        display: inline-block;
    }

    .menu-img{
        position: absolute;
        left: 130%;
        top: 10%;
        display: inline-block;
        cursor: pointer;
        //background: #F1F1F1;
    }

    .open-menu-label{
        right: 10%;
    }

    .menu-label{
        margin-left: 56%;
        margin-top: 3%;
        display: inline-block;
    }

    .close-menu{
        position: absolute;
        left: 190%;
        top: -12%;
        display: inline-block;
        cursor: pointer;
    }

    .menu-with-side-panel{
        position: absolute;
        width: 20%;
        top: 1%;
        right: 0;
        bottom: 0;
    }

    .side-panel{
        position: fixed;
        width: 17.1%;
        height: 100%;
        right: 0;
        bottom: 0;
        background: #F1F1F1;
        box-shadow: 0 0 6px #9b9b9b;
    }

    .side-panel-links{
        position: absolute;
        top: 13.5%;
        bottom: 0;
    }

    .s-p-link{
        margin-left: 13%;
        margin-right: 3%;
        margin-bottom: 5%;
        color: #979797;
        font: bold 195% Yu Gothic UI;
    }

    .d-s-p-info{
        margin-top: 10%;
    }

    .s-p-info{
        margin-left: 13%;
        margin-bottom: 5%;
        color: #707070;
        font: lighter 150% Yu Gothic UI;
    }

    .developer{
        position: absolute;
        bottom: 0;
        margin-left: 13%;
        color: #707070;
        font: 130% Yu Gothic UI;
    }

    .links-and-menu{
        display: inline-block;
    }
</style>