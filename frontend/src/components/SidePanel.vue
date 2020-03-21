<template>

    <div id="app">
        <div class="side-panel-with-links">
            <div class="menu-with-side-panel">
            <div class="side-panel" v-if="state === 'pressed'">
                <div class="side-panel-links">

                    <div class="open-menu">
                        <h2 class="open-menu-label">меню</h2>
                        <img class="close-menu" v-on:click="state = 'not pressed'" src="@/assets/menu-img.png" height="45px" width="45px">
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

</template>

<script>
    export default {
        name: "SidePanel",
        data() {
            return {
                state: 'not pressed',
            }
        }
    }
</script>

<style scoped>
    .link-img{
        width: 30px;
        height: 30px;
        margin-right: 10%;
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
        top: -3px;
        left: 10%;
        height: 6%;
        display: inline-block;
        background: #F1F1F1;
        border: none;
        box-shadow: 0 0 0;
    }

    .m{
        background: #F1F1F1;
        position: absolute;
        top: 0;
        right: 0;
        height: 7%;
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
        top: 11%;
        display: inline-block;
        cursor: pointer;
        background: #F1F1F1;
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
        top: -17%;
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