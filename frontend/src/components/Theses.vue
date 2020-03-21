<template>
    <div class="big-body" id="app">
        <NavItems></NavItems>

        <div class="body">
            <h1>ДИПЛОМНЫЕ РАБОТЫ </h1>

            <div class="filter-by-year">
                <p class="filter">2020</p>
                <p class="filter">2019</p>
                <p class="filter">2018</p>
                <p class="filter">2017</p>
            </div>

            <div class="container-for-content">
                <div class="content-e">
                    <div v-for="diploma in diplomas" :key="diploma.id">
                        <div class="exhibition">
                            <img class="exhibition-preview" v-bind:src="require('@/assets/pics/preview/' + diploma.Preview.slice(118))" :alt="diploma.Preview.slice(125)" width="440" height="440">
                            <div class="diploma-description">
                                <h4>{{diploma.Title}}</h4>
                                <p>{{diploma.ReleaseYear}}</p>

                                <p class="object-technique" v-if="diploma.IdTechnique === 1">БАТИК</p>
                                <p class="object-technique" v-else-if="diploma.IdTechnique === 2">ШАРФ</p>
                                <p class="object-technique" v-else-if="diploma.IdTechnique === 3">АКВАРЕЛЬ</p>
                                <p class="object-technique" v-else-if="diploma.IdTechnique === 4">ЖИВОПИСЬ</p>


                                <div class="object-size-container">
                                    <p class="object-size">{{diploma.SizeHeight}} СМ х</p>
                                    <p class="object-size">{{diploma.SizeWidth}} СМ</p>
                                </div>

                                Студент:
                                <p>{{diploma.StudentsFIO}}</p>
                                Куратор:
                                <p>{{diploma.Description}}</p>

                                <!-- <div class="file-container-e">
                                    <img class="file" src="@/assets/read.png">
                                    <img class="file" src="@/assets/download.png">
                                </div> -->
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
        name: 'diplomas',
        components: {SidePanel, NavItems},
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
    .diploma-description{
        position: absolute;
        display: inline-block;
        width: 500px;
        height: 450px;
        right: -10px;
        top: 50px;
        text-align: center;
        line-height: 2;
        margin: 30px;
    }

    .filter-by-year{
        position: absolute;
        left: 0;
        width: 16.5%;
        top: 20%;
        bottom: 0;
    }
</style>