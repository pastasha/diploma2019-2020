<template>
    <div id="app">
        <NavItems></NavItems>

        <div class="body">
            <h1>МЕТОДИЧЕСКИЕ РАБОТЫ</h1>

                <div class="filter-by-year">
                    <p class="filter">2020</p>
                    <p class="filter">2019</p>
                    <p class="filter">2018</p>
                    <p class="filter">2017</p>
                </div>

                <div class="container-for-content-met">
                    <div class="content-met">
                    <div v-for="met in methodical" :key="met.id">
                        <div class="methodical">
                            <img class="methodical-preview" v-bind:src="require('@/assets/pics/preview/' + met.Preview.slice(121))" :alt="met.Preview.slice(114)" width="320">
                            <div class="methodical-description">
                                <p class="methodical-title">{{met.Name}}</p>
                                <p class="methodical-author-and-year">{{met.Author}}</p>
                                <p class="methodical-author-and-year">{{met.CreationDate}}</p>
                            </div>
                            
                            <div class="file-container">
                                <img class="act-with-file" src="@/assets/read.png" title="читать каталог онлайн">
                                <img class="act-with-file" src="@/assets/download.png" title="скачать каталог">

                                <!--<a download v-bind:href="require('@/assets/files/' + met.Path.slice(118))" :alt="met.Path.slice(118)">
                                    <img class="act-with-file" src="@/assets/download.png">
                                </a>-->
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
        name: 'methodical-work',
        components: {SidePanel, NavItems},
        computed: mapGetters(['methodical']),
        beforeMount () {
            this.$store.dispatch('getMethodical')
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
    .file-container{
        position: absolute;
        right: 0;
        top: 0;
        margin-top: 30px;
        margin-right: 20px;
    }

    .act-with-file{
        position: relative;
        height: 40px;
        width: 40px;
        margin-left: 10px;
    }

    .methodical-title, .methodical-author-and-year{
        font: 1em Yu Gothic;
        margin-bottom: 0;
    }

    .methodical-description{
        position: absolute;
        margin: 18px;
        left: 100px;
    }

    .methodical-preview{
        margin: 10px;
        position: absolute;
        height: 80px;
        width: 80px;
    }

    .methodical{
        display: grid;
        left: 0;
        right: 0;
        top: 5%;
        bottom: 0;
        width: 100%;
        height: 100px;
        box-shadow: 0 0 6px #9b9b9b;
        position: relative;
    }

    .filter-by-year{
        position: absolute;
        left: 0;
        width: 16.5%;
        top: 20%;
        bottom: 0;
    }

    .content-met{
        display: grid;
        grid-template-rows: 130px;
        top: 0;
        bottom: 0;
        left: 0;
    }

    .container-for-content-met{
        position: relative;
        left: 0;
        top: 0;
        width: 100%;
        padding: 1% 21% 5%;
        display: inline-block;
    }
</style>