<template>
    <div class="big-body" id="app">
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
                    <div class="exhibition">
                        <img class="exhibition-preview" v-bind:src="require('@/assets/pics/preview/' + exhibition.Preview.slice(121))" :alt="exhibition.Preview.slice(125)" width="440" height="440">
                        <div class="exhibition-description">
                            <h4>{{exhibition.Name}}</h4>
                            <p>{{exhibition.CreationDate}}</p>
                            <p>{{exhibition.Place}}</p>
                            <p>{{exhibition.Adress}}</p>
                            Организаторы:
                            <p>{{exhibition.Managers}}</p>
                            Куратор:
                            <p>{{exhibition.Curator}}</p>

                            <div class="file-container-e">
                                <img class="file" src="@/assets/read.png">
                                <img class="file" src="@/assets/download.png">
                            </div>
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

    .exhibition-description{
        position: absolute;
        display: inline-block;
        width: 500px;
        height: 450px;
        right: -10px;
        top: 0;
        text-align: center;
        line-height: 2;
        margin: 30px;
    }

    p{
        font: lighter 15pt Yu Gothic UI;
    }

    .exhibition-preview{
        position: relative;
        display: inline-block;
        margin: 30px;
    }

    .file-container-e{
        position: absolute;
        left: 130px;
        bottom: 0;
    }

    .file{
        position: relative;
        height: 50px;
        width: 50px;
        margin-left: 50px;
    }

    .exhibition{
        display: grid;
        left: 290px;
        right: 250px;
        top: 10%;
        bottom: 0;
        width: 1000px;
        height: 500px;
        box-shadow: 0 0 15px #bdbdbd;
        position: relative;
    }

    .filter-by-year{
        position: absolute;
        left: 0;
        width: 16.5%;
        top: 20%;
        bottom: 0;
    }
</style>