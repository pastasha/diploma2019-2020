<template>
    <div id="app" class="app">
        <div class="big-body">
            <div class="nav-item">
                <router-link to="/"> <img class="logo-link" src="@/assets/logo_paint.png"> </router-link>
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

            <div class="main-description">
                <div class="main-title"> ШАРФЫ </div>
                <div class="author"> БОГАЙЧУК ЛЮДМИЛА РОМАНОВНА </div>

                <div class="short-description">
                    Не все компоненты работают сами по себе. Большей части требуются входные данные, на основании которых они выполняют свою логику, генерируют шаблон и, возможно, передают часть в используемые ими компоненты.
                </div>

                <router-link to="/gallery">
                    <button class="full-picture-state">ГАЛЕРЕЯ</button>
                </router-link>
            </div>

            <div class="next-pages">
                <router-link to="/"> <button class="paint-page"/> </router-link>
                <router-link to="/aqua-page"> <button class="aqua-page"/> </router-link>
                <router-link to="/batik-page"> <button class="batik-page"/> </router-link>
                <router-link to="/sha-page"> <button class="sha-page"/> </router-link>
            </div>

            <div class="side-panel-with-links">
                <div class="menu-with-side-panel">
                    <div class="side-panel" v-if="state === 'pressed'">
                        <div class="side-panel-links">

                            <div class="open-menu">
                                <h2 class="open-menu-label">меню</h2>
                                <img class="close-menu" v-on:click="state = 'not pressed'" src="@/assets/menu-img-paint.png" height="45px" width="45px">
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
                                <img class="link-img" src="@/assets/telegram_logo_paint.png">
                            </a>
                            <a class="link" href="">
                                <img class="link-img" src="@/assets/instagram_logo_paint.png">
                            </a>
                            <a class="link" href="https://www.facebook.com/profile.php?id=100001281610367&fref=profile_friend_list&hc_location=friends_tab">
                                <img class="link-img" src="@/assets/facebook_logo_paint.png">
                            </a>
                        </div>


                        <div class="m" v-if="state === 'not pressed'"></div>
                        <div class="menu" v-if="state === 'not pressed'">
                            <h2 class="menu-label">меню</h2>
                            <img class="menu-img" v-on:click="state = 'pressed'" v-if="state === 'not pressed'" src="@/assets/menu-img-paint.png" height="45px" width="45px">
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "MainSha",
        data() {
            return {
                state: 'not pressed'
            }
        }
    }
</script>

<style scoped>
    .paint-page, .batik-page, .aqua-page{
        background-color: #DED5CA;
        box-shadow: 0 0 10px #535355;
    }

    .sha-page{
        background-color: #535355;
        box-shadow: 0 0 10px #DED5CA;
    }

    .paint-page, .aqua-page, .batik-page, .sha-page {
        border: none;
        padding: 10px;
        display: inline-block;
        margin-right: 20px;
        border-radius: 50%;
    }

    .next-pages{
        width: 250px;
        height: 50px;
        position: absolute;
        bottom: 20px;
        left: 705px;
    }

    .short-description{
        margin: 10px;
        text-align: center;
        font: 500 13pt Yu Gothic UI;
        color: #27262D;
    }

    .full-picture-state{
        position: relative;
        text-transform: uppercase;
        width: 500px;
        background-color: #d8d8d5;
        height: 60px;
        margin-top: 35px;
        box-shadow: 0 0 10px rgb(119, 116, 137);
        padding: 0;
        border: none;
        text-align: center;
        font: 600 13pt Yu Gothic;
        color: #27262D;
        left: 130px;
    }

    .author{
        font: 600 19pt Yu Gothic;
        color: #27262D;
        text-align: center;
    }

    .main-title{
        margin-bottom: -25px;
        font: 400 60pt Yu Gothic;
        color: #27262D;
        text-align: center;
    }

    .main-description{
        position: absolute;
        top: 300px;
        left: 400px;
        right: 500px;
        bottom: 200px;
    }


    .app{
        position: absolute;
        right: 0;
        width: 100%;
        height: 100%;
        background: url(~@/assets/main-page-photos/bkg-sha.jpg) no-repeat fixed;
        background-size: cover;
    }

    .big-body{
        position: absolute;
        top: 0;
        left: 5%;
        right: 0;
        bottom: 0;
    }

    h2{
        color: #17161a;
        font: bold 125% Yu Gothic;
    }

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
        color: #302f38;
        font: bold 120% Yu Gothic;
    }

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
        background: #C7C4BE;
        border: none;
        box-shadow: 0 0 0;
    }

    .m{
        background: #C7C4BE;
        position: absolute;
        top: 0;
        right: 0;
        height: 7%;
        width: 90%;
        box-shadow: 0 0 10px rgb(181, 181, 181);
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
        background: #C7C4BE;
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
        background: #C7C4BE;
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
        color: #3a3943;
        font: bold 195% Yu Gothic UI;
    }

    .d-s-p-info{
        margin-top: 10%;
    }

    .s-p-info{
        margin-left: 13%;
        margin-bottom: 5%;
        color: #3a3943;
        font: lighter 150% Yu Gothic UI;
    }

    .developer{
        position: absolute;
        bottom: 0;
        margin-left: 13%;
        color: #3a3943;
        font: 130% Yu Gothic UI;
    }

    .links-and-menu{
        display: inline-block;
    }

</style>