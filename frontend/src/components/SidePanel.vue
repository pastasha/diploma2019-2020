<template>

    <div class="menu-with-side-panel" id="app">

        <aside v-bind:style="{ height: heightSize }">
            <ul class="links">
                <li>
                    <a href="">
                        <img class="link-img" src="@/assets/telegram_logo.png">
                    </a>
                </li>
                <li>
                    <a href="">
                        <img class="link-img" src="@/assets/instagram_logo.png">
                    </a>
                </li>
                <li>
                    <a href="https://www.facebook.com/profile.php?id=100001281610367&fref=profile_friend_list&hc_location=friends_tab">
                        <img class="link-img" src="@/assets/facebook_logo.png">
                    </a>
                </li>
            </ul>

            <div class="open-menu" v-on:click="showMenu">
                <h2>меню</h2>
                <img src="@/assets/menu-img.png">
            </div>

            <div v-if="active === true">

                <ul class="s-p-items">
                    <li>
                        <router-link to="/about-author"><p> ОБ АВТОРЕ </p></router-link>
                    </li>
                    <li>
                        <router-link to="/gallery"><p> ГАЛЕРЕЯ </p></router-link>
                    </li>
                    <li>
                        <router-link to="/exhibitions"><p> ВЫСТАВКИ </p></router-link>
                    </li>
                    <li>
                        <router-link to="/theses"><p>ДИПЛОМНЫЕ РАБОТЫ</p></router-link>
                    </li>
                    <li>
                        <router-link to="/press"><p>ПРЕССА</p></router-link>
                    </li>
                    <li>
                        <router-link to="/methodical-works"><p>МЕТОДИЧЕСКИЕ РАБОТЫ</p></router-link>
                    </li>
                    <li>
                        <router-link :to = "{
                                  name: 'Feedback',
                                  params: {
                                      title: '',
                                      preview: '',
                                      picture: ''
                                  }
                                }">
                            <p>ОБРАТНАЯ СВЯЗЬ</p></router-link>
                    </li>
                </ul>
                <ul class="s-p-info">
                    <li>
                        Телефон:<br>+380996477383
                    </li>
                    <li>
                        Email:<br>papastasha@gmail.com<br>polinicus@gmail.com
                    </li>
                </ul>
                <h2 class="developer">2019@<a href="https://github.com/pastasha">PASTASHA</a></h2>

            </div>
        </aside>

    </div>

</template>

<script>
    export default {
        name: "SidePanel",
        data() {
            return {
                active: false,
                heightSize: 50 + 'px',
            }
        },
        methods: {
            showMenu : function () {
                if(this.active === false){
                    this.active = true;
                    this.heightSize = 100 + '%';
                } else {
                    this.active = false;
                    this.heightSize = 50 + 'px';
                }
            }
        }
    }
</script>

<style scoped>
    .side-panel active{
        border: solid hotpink 1px;
    }

    a{
        color: #979797;
    }

    .link-img{
        width: 25px;
        height: 25px;
    }

    .links{
        position: absolute;
        left: -180px;
        top: 0;
        width: 100%;
    }

    .links li{
        position: relative;
        display: inline-block;
        margin-right: 5px;
    }

    .open-menu{
        position: absolute;
        top: 0;
        right: 0;
        left: 0;
        height: 10%;
        padding-top: 16px;
        padding-right: 10px;
        padding-left: 33%;
    }

    .open-menu img{
        position: absolute;
        right: 10px;
        top: 6px;
        display: inline-block;
        cursor: pointer;
        width: 40px;
        height: 40px;
    }

    .menu-with-side-panel{
        position: absolute;
        width: 20%;
        top: 1%;
        right: 0;
        bottom: 0;
    }

    aside {
        position: fixed;
        width: 20%;
        top: 0;
        right: 0;
        bottom: 0;
        margin-left: 30px;
        margin-top: 1%;
        padding-right: 30px;
        background: #F1F1F1;
        box-shadow: 0 0 6px #c0c0c0;
    }

    .s-p-items{
        margin-top: 70px;
    }

    .s-p-items p{
        margin-bottom: 5%;
        color: #979797;
        font: bold 150% Yu Gothic UI;
    }

    .s-p-info{
        color: #707070;
        font: lighter 120% Yu Gothic UI;
    }

    .developer{
        position: absolute;
        bottom: 0;
        margin-left: 13%;
        color: #707070;
        font: 130% Yu Gothic UI;
    }
</style>