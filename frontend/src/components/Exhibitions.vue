<template>
    <div id="app">
        <NavItems></NavItems>

        <div class="body">
            <h1>АРХИВ ВЫСТАВОК</h1>

            <div class="filter-by-year">
                <p class="filter">2020</p>
                <p class="filter">2019</p>
                <p class="filter">2018</p>
                <p class="filter">2017</p>
            </div>

            <div class="container-for-content">
                <div class="content-e">
                <div v-for="exhibition in exhibitions" :key="exhibition.id">
                    <div class="content">
                        <img v-bind:src="require('@/assets/pics/preview/' + exhibition.Preview.slice(121))" :alt="exhibition.Preview.slice(125)" width="440" height="440">
                        <div class="content-description">
                            <h4>{{exhibition.Name}}</h4>
                            <p>{{exhibition.CreationDate}}</p>
                            <p>{{exhibition.Place}}</p>
                            <p>{{exhibition.Adress}}</p>
                            Организаторы:
                            <p>{{exhibition.Managers}}</p>
                            Куратор:
                            <p>{{exhibition.Curator}}</p>

                            <!--<div class="files">
                                <img src="@/assets/read.png" title="читать каталог онлайн">
                                <img src="@/assets/download.png" title="скачать каталог">
                            </div>-->
                        </div>
                    </div>
                </div>
            </div>
            </div>

        </div>

        <SidePanel></SidePanel>
    </div>
</template>

<script>
    import SidePanel from "./SidePanel";
    import NavItems from "./NavItems";
    import { mapGetters } from 'vuex'
    export default {
        name: 'exhibitions',
        components: {SidePanel, NavItems},
        computed: mapGetters(['exhibitions']),
        beforeMount () {
            this.$store.dispatch('getExhibitions')
        },
        data() {
            return {
                hover: false,
            };
        }

    }
</script>

<style>
    .content-e{
        display: grid;
        grid-template-rows: 600px;
        margin-bottom: 150px;
        bottom: 0;

        left: 0;
        column-width: 320px;
        column-gap: 15px;
        width: 90%;
        max-width: 1100px;
    }

    h4{
        text-transform: uppercase;
        margin-bottom: 50px;
    }

    .files{
        border: solid aqua 1px;
    }

    .files img{
        height: 50px;
        width: 50px;
    }

    .content{
        position: relative;
        display: grid;
        left: 270px;
        right: 250px;
        top: 0;
        bottom: 0;
        height: 400px;
        width: 700px;
        box-shadow: 0 0 15px #bdbdbd;
    }

    .content img{
        position: absolute;
        display: inline-block;
        width: 60%;
        height: 100%;
    }

    .content-description{
        position: absolute;
        top: 0;
        right: 0;
        bottom: 0;
        left: 60%;
        padding-top: 6%;
        padding-left: 2%;
        padding-right: 2%;
        text-align: center;
        line-height: 2;
        vertical-align: middle;
    }

    .content-description p{
        font: lighter 100% Yu Gothic UI;
    }


    .filter-by-year{
        position: absolute;
        left: 0;
        width: 16.5%;
        top: 20%;
        bottom: 0;
    }
</style>