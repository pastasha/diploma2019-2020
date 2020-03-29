<template>
    <div class="main-body" id="app">
        <NavItems class="nav-items-main"></NavItems>
        <h1 class="main-title">БОГАЙЧУК ЛЮДМИЛА</h1>
        <div class="main-container">
            <div class="techniques">
                <router-link to="/gallery"><p>АКВАРЕЛЬ</p></router-link>
                <router-link to="/gallery"><p>ЖИВОПИСЬ</p></router-link>
                <router-link to="/gallery"><p>БАТИК</p></router-link>
                <router-link to="/gallery"><p>АБСТРАКЦИЯ</p></router-link>
                <router-link to="/gallery"><p>ШАРФ</p></router-link>
            </div>
        </div>

        <SidePanel></SidePanel>
    </div>
</template>

<script>
    import SidePanel from "./SidePanel";
    import NavItems from "./NavItems";
    export default {
        name: "Main",
        components: {SidePanel, NavItems},
    }
</script>

<style>
    .techniques p{
        position: relative;
        display: inline-block;
        margin: 10px 136px 10px 125px;
    }

    .techniques{
        position: absolute;
        bottom: 230px;
        background-color: white;
        left: 0;
        right: 0;
    }

    .main-title{
        position: absolute;
        top: 17%;
        right: 4%;
    }

    .main-container{
        position: absolute;
        top: 26%;
        right: 0;
        width: 100%;
        height: 100%;
        background: url(~@/assets/main-back.png) no-repeat;
        background-size: 100% auto;

    }

    .nav-items-main{
        position: absolute;
        top: 0;
        left: 5%;
        right: 0;
        bottom: 0;
    }

    .main-body{
        position: absolute;
        overflow: hidden;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
    }

</style>