<template>
    <div class="big-body" id="app">

        <div class="nav-item">
            <router-link to="/"> <img class="logo-link" src="@/assets/logo.png"> </router-link>
        </div>

        <div class="body">
            <!--

            {{ $route.params.preview }}

            -->

            <div class="full-picture-container">
                <div class="picture-full-description">
                    <br>
                    <div class="picture-name-and-year-container">
                        <p class="full-title">{{ $route.params.title }}</p>
                        <p class="full-year">{{ $route.params.creation_date }}</p>
                    </div>

                    <div class="full-picture-description">
                        <p class="full-technique" v-if="$route.params.technique === 1">БАТИК</p>
                        <p class="full-technique" v-else-if="$route.params.technique === 0">ШАРФ</p>
                        <p class="full-technique" v-else-if="$route.params.technique === 2">АКВАРЕЛЬ</p>
                        <p class="full-technique" v-else-if="$route.params.technique === 3">ЖИВОПИСЬ</p>
                        <p class="f-object-size">{{ $route.params.height }} СМ х</p>
                        <p class="f-object-size">{{ $route.params.width }} СМ</p>
                        <p class="full-picture-description-item">МАТЕРИАЛЫ</p>
                        <p class="full-picture-description-itemm">{{ $route.params.materials }}</p>
                    </div>

                    <button class="full-picture-state" v-if="$route.params.status === 'a'">СОБСТВЕННОСТЬ АВТОРА</button>
                    <button class="full-picture-state" v-else-if="$route.params.status === 'p'">ПРИВАТНАЯ КОЛЛЕКЦИЯ</button>
                    <button class="full-picture-state" v-else-if="$route.params.status === 's'">В ПРОДАЖЕ</button>

                    <div class="pages">

                    </div>

                    <p class="full-picture-moto">Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты. Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового океана. Маленький ручеек Даль журчит по всей стране и обеспечивает ее всеми необходимыми правилами. Эта парадигматическая страна, в которой жаренные члены предложения залетают прямо в рот.
                        {{ $route.params.description }}</p>
                </div>

                <div class="full-list-of-selected-picture">
                    <img class="right-arrow" src="@/assets/arrow-right.png">
                    <img class="left-arrow" src="@/assets/arrow-left.png">

                    <img class="full-picture" v-bind:src="require('@/assets/pics/preview/' + $route.params.preview)" :alt="$route.params.preview">
                </div>
            </div>
        </div>

        <SidePanel></SidePanel>

    </div>
</template>

<script>
    import SidePanel from "./SidePanel";

    export default {
        name: "Picture",
        components: {SidePanel}
    }

</script>

<style>
    .logo-link{
        width: 25%;
        height: 25%;
    }

    .full-picture-moto{
        margin-top: 110px;
        font: lighter 13pt Yu Gothic UI;
    }

    .full-picture-description{
        margin-top: -30px;
    }

    .f-object-size{
        text-align: center;
        text-transform: uppercase;
        font: 12pt Yu Gothic;
        display: inline-block;
        margin-bottom: 10px;
    }

    .full-picture-description-item{
        margin: 0;
        font: 12pt Yu Gothic;
    }

    .full-picture-description-itemm{
        margin: 0;
        font: lighter 12pt Yu Gothic UI;
    }

    .full-picture-state{
        position: relative;
        text-transform: uppercase;
        width: 350px;
        background-color: #F5F5F5;
        height: 40px;
        margin-top: 35px;
        box-shadow: 0 3px 6px rgb(222, 222, 222);
        padding: 0;
        border: none;
        text-align: center;
        font: 11pt Yu Gothic UI;
        color: #9e9e9e;
    }

    .full-picture{
        position: absolute;
        right: 21%;
        height: 720px;
        border: solid 10px white;
        box-shadow: 0 0 10px #9b9b9b;
    }

    .right-arrow{
        position: absolute;
        top: 45%;
        left: 0;
        height: 60px;
    }

    .left-arrow{
        position: absolute;
        top: 45%;
        right: 0;
        height: 60px;
    }

    .full-list-of-selected-picture{
        position: absolute;
        display: inline-block;
        height: 100%;
        top: 0;
        bottom: 0;
        width: 65%;
    }

    .full-technique{
        text-transform: uppercase;
        font: 12pt Yu Gothic;
        margin-bottom: 10px;
    }

    .full-year{
        display: inline-block;
        font: 15pt Yu Gothic;
    }

    .full-title{
        display: inline-block;
        text-transform: uppercase;
        margin-bottom: 50px;
        font: 30pt Yu Gothic;
    }

    .picture-full-description{
        position: relative;
        display: inline-block;
        width: 35%;
        top: 100px;
    }

    .full-picture-container{
        position: absolute;
        display: table-cell;
        top: -70px;
        bottom: 0;
        height: 730px;
    }
</style>