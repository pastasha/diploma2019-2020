<template>
    <div class="big-body" id="app">
        <div id="gallery">

            <div v-for="note in notes" :key="note.id">
                <router-link to="/picture" class="picture-container">
                    <div @mouseover="hover = true" @mouseleave="hover = false">
                        <img class="picture" v-bind:src="require('@/assets/pics/preview/' + note.Preview.slice(120))" :alt="note.Preview.slice(114)" width="320">
                        <div v-if="hover" class="short-picture-description">
                            <p class="object-title">{{note.Title}}</p>
                            <p class="object-description">{{note.CreationDate.slice(0,4)}}</p>

                            <p class="object-technique" v-if="note.IdTechnique === 1">БАТИК</p>
                            <p class="object-technique" v-else-if="note.IdTechnique === 2">ШАРФ</p>
                            <p class="object-technique" v-else-if="note.IdTechnique === 3">АКВАРЕЛЬ</p>
                            <p class="object-technique" v-else-if="note.IdTechnique === 4">ЖИВОПИСЬ</p>

                            <div class="object-size-container">
                                <p class="object-size">{{note.SizeHeight}} СМ х</p>
                                <p class="object-size">{{note.SizeWidth}} СМ</p>
                            </div>

                            <button class="picture-status" v-if="note.status === 'a'">СОБСТВЕННОСТЬ АВТОРА</button>
                            <button class="picture-status" v-else-if="note.status === 'p'">ПРИВАТНАЯ КОЛЛЕКЦИЯ</button>
                            <button class="picture-status" v-else-if="note.status === 's'">В ПРОДАЖЕ</button>
                        </div>
                    </div>
                </router-link>
            </div>

        </div>
    </div>
</template>

<script>
    import { mapGetters } from 'vuex'
    export default {
        name: 'note-list',
        computed: mapGetters(['notes']),
        beforeMount () {
            this.$store.dispatch('getNotes')
        },
        data() {
            return {
                filter_state: 'batik',
                hover: false,
                note_path: '@/assets/',
            };
        }
    }
</script>

<style>
    div#gallery figure {
        background: #fefefe;
        border: 2px solid #fcfcfc;
        box-shadow: 0 1px 2px rgba(34, 25, 25, 0.4);
        margin: 0 2px 15px;
        padding: 15px;
        padding-bottom: 10px;
        transition: opacity .4s ease-in-out;
        display: inline-block;
        column-break-inside: avoid;
    }
    div#gallery figure img {
        width: 100%; height: auto;
        border-bottom: 1px solid #ccc;
        padding-bottom: 15px;
        margin-bottom: 5px;
    }
    div#gallery figure figcaption {
        font-size: .9rem;
        color: #444;
        line-height: 1.5;
    }
    @media screen and (max-width: 750px) {
        #columns { column-gap: 0px; }
        #columns figure { width: 100%; }
    }
</style>
