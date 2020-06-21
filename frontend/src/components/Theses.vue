<template>
    <div id="app">
        <NavItems></NavItems>

        <div class="body">
            <h1>ДИПЛОМНЫЕ РАБОТЫ </h1>

            <div class="filter-by-year">
                <p>2020</p>
                <p>2019</p>
                <p>2018</p>
                <p>2017</p>
            </div>

            <div class="container-for-content">
                <div v-for="diploma in diplomas" :key="diploma.id">
                    <div class="content" v-bind:style="{ height: heightSize }">

                        <div class="container-for-diploma-photos">
                            <img v-on:click="showDescription"
                                 v-if="active === false"
                                 v-bind:src="require('@/assets/pics/preview/' + diploma.Preview.slice(118))"
                                 :alt="diploma.Preview.slice(125)" width="440" height="440">

                            <div class="photos-and-video" v-if="active === true">
                                <span class="video" v-html="diploma.Video"></span>
                                <div class="photos">
                                    <div class="photo" v-for="photo in diploma_photos" :key="photo.id">
                                        <p>{{photoID = photo.id}}</p>
                                        <img v-bind:src="require('@/assets/pics/main-photos/' + photo.image.slice(128))"
                                             :alt="photo.image.slice(128)">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div v-bind:style="{ paddingTop: paddingSize }" v-on:click="showDescription" class="content-description">

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

                            <!--<div class="files">
                                <button><img src="@/assets/read.png"></button>
                                <button><img src="@/assets/download.png"></button>
                            </div>-->
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
        computed: mapGetters(['diplomas', 'diploma_photos']),
        beforeMount () {
            this.$store.dispatch('getDiplomas');
            this.$store.dispatch('getDiplomaPhotos');
        },
        data() {
            return {
                active: false,
                heightSize: 400 + 'px',
                photoID: 0,
                paddingSize: 6 + '%',
            };
        },
        methods: {
            showDescription : function () {
                if (this.active === false) {
                    this.active = true;
                    this.heightSize = 600 + 'px';
                    this.paddingSize = 20 + '%';
                } else {
                    this.active = false;
                    this.heightSize = 400 + 'px';
                    this.paddingSize = 6 + '%';
                }
            }
        }
    }
</script>

<style scoped>
    .video{
        margin-top: 0;
    }

    .photo p{
        font-size: 0.1em;
    }

    .photos-and-video{
        position: absolute;
        top: 0;
        left: 0;
        bottom: 0;
        width: 100%;
        height: 100%;
        padding-top: 3%;
        padding-left: 3%;
    }

    .container-for-diploma-photos{
        position: absolute;
        top: 0;
        left: 0;
        bottom: 0;
        width: 100%;
        height: 100%;
    }

    .photos{
        position: relative;
        display: grid;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        grid-template-columns: 125px 125px 125px;
        grid-template-rows: 125px 125px 125px;
        grid-column-gap: 10px;
        grid-row-gap: 10px;
        width: 60%;
    }

    .photo{
        position: relative;
        z-index: 2;
    }

    .photo img {
        width: 100%;
        height: 100%;
    }

    .filter-by-year{
        position: absolute;
        left: 0;
        width: 16.5%;
        top: 20%;
        bottom: 0;
    }
</style>