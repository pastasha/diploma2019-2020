<template>
    <div class="big-body" id="app">
        <NavItems></NavItems>

        <div class="body">
            <h1>ГАЛЕРЕЯ</h1>

            <div class="filters">
                <p v-on:click="filter = 1" class="filter">БАТИК</p>
                <p v-on:click="filter = 0" class="filter">ШАРФЫ</p>
                <p v-on:click="filter = 2" class="filter">АКВАРЕЛЬ</p>
                <p v-on:click="filter = 3" class="filter">ЖИВОПИСЬ</p>
            </div>

            <div class="content-g">

                <div v-for="note in notes" :key="note.id">
                    <router-link :to = "{
                                  name: 'Picture',
                                  params: {
                                      creation_date: note.CreationDate.slice(0,4),
                                      description: note.Description,
                                      technique: note.IdTechnique,
                                      materials: note.Materials,
                                      preview: note.Preview.slice(118),
                                      height: note.SizeHeight,
                                      width: note.SizeWidth,
                                      title: note.Title,
                                      status: note.status,
                                      price: note.Price
                                  }
                                }"
                                 v-if="note.IdTechnique === filter"
                                 class="picture-container"> <!-- v-if="note.IdTechnique === filter" -->
                    <div class="picture-container">

                        <div @mouseover="note.Hover = true" @mouseleave="note.Hover = false">
                            <img class="picture-img" v-bind:src="require('@/assets/pics/preview/' + note.Preview.slice(118))" :alt="note.Preview.slice(114)" width="320">
                            <div v-if="note.Hover" :key="note.id" class="short-picture-description">
                                <p class="object-title">{{note.Title}}</p>
                                <p class="object-description">{{note.CreationDate.slice(0,4)}}</p>

                                <p class="object-technique" v-if="note.IdTechnique === 1">{{technique = 'БАТИК'}}</p>
                                <p class="object-technique" v-else-if="note.IdTechnique === 2">{{technique = 'ШАРФ'}}</p>
                                <p class="object-technique" v-else-if="note.IdTechnique === 0">{{technique = 'АКВАРЕЛЬ'}}</p>
                                <p class="object-technique" v-else-if="note.IdTechnique === 3">{{technique = 'ЖИВОПИСЬ'}}</p>

                                <div class="object-size-container">
                                    <p class="object-size">{{note.SizeHeight}} СМ х</p>
                                    <p class="object-size">{{note.SizeWidth}} СМ</p>
                                </div>

                                <button class="picture-status" v-if="note.status === 'a'">СОБСТВЕННОСТЬ АВТОРА</button>
                                <button class="picture-status" v-else-if="note.status === 'p'">ПРИВАТНАЯ КОЛЛЕКЦИЯ</button>

                                <router-link :to = "{
                                  name: 'Checkout',
                                  params: {
                                      title: note.Title,
                                      price: note.Price,
                                      preview: note.Preview.slice(118),
                                      picture: note.Title+'|'+technique+'|'+note.CreationDate+'|'+note.Price+'$'
                                  }
                                }">
                                    <button class="picture-status" v-if="note.status === 's'" title="заказать картину">
                                        {{ note.Price }}$
                                    </button>
                                </router-link>

                            </div>
                        </div>
                    </div>
                    </router-link>
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
        name: 'note-list',
        components: {SidePanel, NavItems},
        computed: mapGetters(['notes']),
        beforeMount () {
            // Перед тем как загрузить страницу, нам нужно получить список всех
            // имеющихся заметок. Для этого мы вызываем действие `getNotes` из
            // нашего хранилища
            this.$store.dispatch('getNotes')
        },
        data() {
            return {
                filter: 3,
                hover: false,
                note_path: '@/assets/',
                check: null,
            };
        }
    }

</script>

<style>
    .object-description, .object-technique, .object-size-container, .object-size{
        text-align: center;
        text-transform: uppercase;
        font: 11pt Yu Gothic;
    }

    .picture-status{
        background-color: #F1F1F1;
        height: 40px;
        width: 275px;
        margin-left: 30px;
        margin-right: 30px;
        margin-bottom: 10%;
        box-shadow: 0 3px 6px rgb(222, 222, 222);
        padding: 0;
        border: none;
        text-align: center;
        text-transform: uppercase;
        font: 11pt Yu Gothic UI;
        color: #9e9e9e;
    }

    .object-size{
        display: inline-block;
        margin-bottom: 7%;
    }

    .object-technique{
        margin-bottom: 1%;
    }

    .object-description{
        margin-bottom: 7%;
    }

    .object-title{
        font: lighter 21pt Yu Gothic UI;
        margin-top: 5%;
        margin-bottom: 0;
        text-align: center;
        text-transform: uppercase;
    }

    .picture-container{
        position: relative;
    }

    .picture-img{
        border: solid 10px white;
        box-shadow: 0 0 6px #9b9b9b;
        margin: 10px;
        width: 340px;
        z-index: 2;
    }

    .short-picture-description{
        position: absolute;
        top: 10px;
        bottom: 80px;
        left: 10px;
        right: 10px;
        width: 340px;
        height: 93%;
        z-index: 1;
        background-color: white;
    }

    .content-g {
        column-width: 320px;
        column-gap: 15px;
        width: 90%;
        max-width: 1100px;
        margin: 30px auto;
    }

    .filter{
        margin-bottom: 15%;
        color: #707070;
        font: lighter 15pt Yu Gothic;
        cursor: pointer;
    }

    .filters{
        position: absolute;
        left: 0;
        width: 16.5%;
        top: 20%;
        bottom: 0;
    }

    h1{
        top: 0;
        text-align: center;
        color: #707070;
        font: lighter 40pt Yu Gothic;
    }

    .body{
        position: absolute;
        left: 0;
        right: 100px;
        top: 210px;
        bottom: 0;
    }
</style>