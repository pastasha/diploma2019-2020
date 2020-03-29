<template>
    <div class="big-body" id="app">
        <NavItems></NavItems>

        <div class="body">
            <h1>ПРЕССА</h1>

            <div class="filter-and-content">
                <div class="filter-by-year">
                    <p class="filter">2020</p>
                    <p class="filter">2019</p>
                    <p class="filter">2018</p>
                    <p class="filter">2017</p>
                </div>
                <div class="container-for-content">
                    <div class="content">
                    <div v-for="met in press" :key="met.id">
                        <div class="methodical">
                            <img class="methodical-preview" v-bind:src="require('@/assets/pics/preview/' + met.Preview.slice(121))" :alt="met.Preview.slice(114)" width="320">
                            <div class="methodical-description">
                                <p class="methodical-title">{{met.Name}}</p>
                                <p class="methodical-author-and-year">{{met.Author}}</p>
                                <p class="methodical-author-and-year">{{met.CreationDate}}</p>
                            </div>

                            <div class="file-container">
                                <img class="act-with-file" src="@/assets/read.png" title="читать статью онлайн">
                                <img class="act-with-file" src="@/assets/download.png" title="скачать статью">

                                <!--<a download v-bind:href="require('@/assets/files/' + met.Path.slice(118))" :alt="met.Path.slice(118)">
                                    <img class="act-with-file" src="@/assets/download.png">
                                </a>-->
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
        name: 'press',
        components: {SidePanel, NavItems},
        computed: mapGetters(['press']),
        beforeMount () {
            this.$store.dispatch('getPress')
        },
        data() {
            return {
                hover: false,
                note_path: '@/assets/',
            };
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

    .file-container{
        position: absolute;
        right: 0;
        top: 0;
        margin-top: 70px;
        margin-right: 50px;
    }

    .act-with-file{
        position: relative;
        height: 60px;
        width: 60px;
        margin-left: 50px;
    }

    .methodical-title{
        font: lighter 30pt Yu Gothic;
        margin-bottom: 10px;
    }

    .methodical-author-and-year{
        font: lighter 15pt Yu Gothic;
        margin-left: 10px;
        margin-bottom: 10px;
    }

    .methodical-description{
        position: absolute;
        margin: 20px;
        left: 200px;
    }

    .methodical-preview{
        margin: 30px;
        position: absolute;
        height: 140px;
        width: 140px;
    }

    .methodical{
        position: relative;
        display: grid;
        left: 0;
        right: 0;
        top: 0;
        bottom: 0;
        height: 200px;
        box-shadow: 0 0 15px #9b9b9b;
    }

    .content{
        display: grid;
        grid-template-rows: 300px;
        top: 0;
        bottom: 0;
        left: 0;
    }

    .container-for-content{
        position: relative;
        left: 0;
        top: -25px;
        width: 1000px;
        display: inline-block;
    }

    .filter-by-year{
        position: relative;
        left: 0;
        width: 16%;
        top: -60px;
        display: inline-block;
    }

</style>