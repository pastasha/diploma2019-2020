<template>
    <div class="main-body" id="app">
        <NavItems></NavItems>

        <h1>БОГАЙЧУК ЛЮДМИЛА</h1>
        <div class="main-container">
            <figure>
                <p><img src="@/assets/main-back-aqua.png" alt="АКВАРЕЛЬ" /></p>
                <figcaption>
                    <router-link to="/gallery"><p>АКВАРЕЛЬ</p></router-link>
                </figcaption>
            </figure>

            <figure>
                <p><img src="@/assets/main-back-paint.png" alt="ЖИВОПИСЬ" /></p>
                <figcaption>
                    <router-link to="/gallery"><p>ЖИВОПИСЬ</p></router-link>
                </figcaption>
            </figure>

            <figure>
                <p><img src="@/assets/main-back-batik.png" alt="БАТИК" /></p>
                <figcaption>
                    <router-link to="/gallery"><p>БАТИК</p></router-link>
                </figcaption>
            </figure>

            <figure>
                <p><img src="@/assets/main-back-abstract.png" alt="АБСТРАКЦИЯ" /></p>
                <figcaption>
                    <router-link to="/gallery"><p>АБСТРАКЦИЯ</p></router-link>
                </figcaption>
            </figure>

            <figure>
                <p><img src="@/assets/main-back-sharf.png" alt="ШАРФ" /></p>
                <figcaption>
                    <router-link to="/gallery"><p>ШАРФ</p></router-link>
                </figcaption>
            </figure>
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
    figcaption p{
        font: lighter 1.5em Yu Gothic UI;
        color: #7e7f7f;
    }

    .techniques p{
        position: relative;
        display: inline-block;
        margin: 10px 136px 10px 125px;
    }

    .main-container{
        position: absolute;
        top: 26%;
        right: 0;
        width: 100%;
        height: 100%;
        bottom: 0;
        left: 0;
    }

    .main-container figure{
        position: relative;
        display: inline-block;
        width: 20%;
        top: 0;
        left: 0;
        bottom: 0;
    }

    .main-container img{
        position: absolute;
        top: 0;
        left: 0;
        bottom: 0;
        width: 100%;
    }

    .main-container figcaption{
        position: absolute;
        width: 100%;
        top: 480px;
        background-color: white;
        color: grey;
    }

    .main-body{
        position: absolute;
        overflow: hidden;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
    }

    .main-body h1{
        position: absolute;
        top: 18%;
        right: 5.5%;
        font: lighter 250% Yu Gothic;
    }
</style>