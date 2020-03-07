<template>
    <div id="app">
        <div class="body">
            <h1>ДИПЛОМНЫЕ РАБОТЫ </h1>

            <div class="filter-by-year">
                <p class="filter">2020</p>
                <p class="filter">2019</p>
                <p class="filter">2018</p>
                <p class="filter">2017</p>
            </div>

            <div class="container-for-content">
                <div class="content">
                <div v-for="met in diplomas" :key="met.id">
                    <div class="methodical">
                        <img class="methodical-preview" v-bind:src="require('@/assets/pics/preview/' + met.Preview.slice(125))" :alt="met.Preview.slice(114)" width="320">
                        <div class="methodical-description">
                            <p class="methodical-title">{{met.Name}}</p>
                            <p class="methodical-author-and-year">{{met.Author}}</p>
                            <p class="methodical-author-and-year">{{met.CreationDate}}</p>
                        </div>

                        <div class="file-container">
                            <img class="act-with-file" src="@/assets/read.png">

                            <a download v-bind:href="require('@/assets/files/' + met.Path.slice(118))" :alt="met.Path.slice(118)">
                                <img class="act-with-file" src="@/assets/download.png">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            </div>

        </div>
    </div>
</template>

<script>
    import { mapGetters } from 'vuex'
    export default {
        name: 'diplomas',
        computed: mapGetters(['diplomas']),
        beforeMount () {
            this.$store.dispatch('getDiplomas')
        },
        data() {
            return {
                hover: false,
                note_path: '@/assets/',
            };
        }

    }
</script>

<style scoped>
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

    .methodical-list{
        display: grid;
        grid-template-rows: 300px;
        top: 18%;
        bottom: 0;
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
        display: grid;
        left: 240px;
        right: 240px;
        top: 18%;
        bottom: 0;
        width: 1100px;
        height: 200px;
        box-shadow: 0 0 15px #9b9b9b;
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