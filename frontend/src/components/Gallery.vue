<template>
    <div id="app">
        <NavItems></NavItems>

        <div class="body">
            <h1>ГАЛЕРЕЯ</h1>

            <div class="filters">
                <p v-on:click="filter = 1">БАТИК</p>
                <p v-on:click="filter = 0">ШАРФЫ</p>
                <p v-on:click="filter = 2">АКВАРЕЛЬ</p>
                <p v-on:click="filter = 3">ЖИВОПИСЬ</p>
            </div>

            <div class="content-g">
                <div v-for="note in notes" :key="note.id">

                    <router-link :to = "{
                                  name: 'Picture',
                                  params: {
                                      id: note.id,
                                      creation_date: note.CreationDate.slice(0,4),
                                      description: note.Description,
                                      technique: note.IdTechnique,
                                      materials: note.Materials,
                                      preview: note.Preview.slice(122),
                                      height: note.SizeHeight,
                                      width: note.SizeWidth,
                                      title: note.Title,
                                      status: note.status,
                                      price: note.Price
                                  }
                                }"
                                 v-if="note.IdTechnique === filter">

                    <div class="picture">
                        <div @mouseover="note.Hover = true" @mouseleave="note.Hover = false">
                            <img v-bind:src="require('@/assets/pics/preview/' + note.Preview.slice(122))" :alt="note.Preview.slice(114)">

                            <div v-if="note.Hover" :key="note.id" class="short-picture-description">
                                <h1>{{note.Title}}</h1>
                                <p>{{note.CreationDate.slice(0,4)}}</p>

                                <p v-if="note.IdTechnique === 1">{{technique = 'БАТИК'}}</p>
                                <p v-if="note.IdTechnique === 2">{{technique = 'ШАРФ'}}</p>
                                <p v-else-if="note.IdTechnique === 0">{{technique = 'АКВАРЕЛЬ'}}</p>
                                <p v-else-if="note.IdTechnique === 3">{{technique = 'ЖИВОПИСЬ'}}</p>

                                <p class="object-size">{{note.SizeHeight}} СМ х</p>
                                <p class="object-size">{{note.SizeWidth}} СМ</p>

                                <button v-if="note.status === 'a'">СОБСТВЕННОСТЬ АВТОРА</button>
                                <button v-else-if="note.status === 'p'">ПРИВАТНАЯ КОЛЛЕКЦИЯ</button>

                                <router-link :to = "{
                                  name: 'Checkout',
                                  params: {
                                      id: note.id,
                                      title: note.Title,
                                      price: note.Price,
                                      preview: note.Preview.slice(122),
                                      picture: note.Title+'|'+technique+'|'+note.CreationDate+'|'+note.Price+'$'
                                  }
                                }">
                                    <button v-if="note.status === 's'" title="заказать картину">
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
            this.$store.dispatch('getNotes');
        },
        data() {
            return {
                filter: 1,
                hover: false,
                note_path: '@/assets/',
                check: null,
            };
        }
    }

</script>

<style>
    .body{
        position: absolute;
        left: 5%;
        right: 0;
        top: 22%;
        bottom: 0;
    }

    h1{
        top: 0;
        text-align: center;
        color: #707070;
        font: lighter 250% Yu Gothic;
    }

    .filters p{
        margin-bottom: 15%;
        color: #707070;
        font: lighter 100% Yu Gothic;
        cursor: pointer;
    }

    .filters{
        position: absolute;
        left: 0;
        width: 16.5%;
        top: 20%;
        bottom: 0;
    }

    .content-g {
        position: absolute;
        left: 0;
        right: 0;
        column-width: 250px;
        column-gap: 15px;
        width: 100%;
        padding-right: 10%;
        padding-left: 10%;
        max-width: 1100px;
        margin: 30px auto;
    }

    .picture{
        position: relative;
    }

    .picture img{
        border: solid 7px white;
        box-shadow: 0 0 10px #9b9b9b;
        margin-bottom: 10px;
        margin-left: 10px;
        width: 100%;
        z-index: 2;
    }

    .short-picture-description{
        position: absolute;
        top: 0;
        bottom: 0;
        left: 10px;
        right: 10px;
        width: 100%;
        height: 100%;
        padding-top: 10%;
        z-index: 1;
        background-color: white;
        text-align: center;
        font: 1em Yu Gothic;
        text-transform: uppercase;
    }

    .short-picture-description p{
        color: #3a3943;
    }

    .short-picture-description h1{
        font: lighter 21pt Yu Gothic UI;
        margin-top: 5%;
        margin-bottom: 0;
    }

    .short-picture-description li{
        text-align: center;
    }

    .object-size{
        display: inline-block;
    }

    .short-picture-description button{
        background-color: #F1F1F1;
        height: 40px;
        width: 80%;
        margin-bottom: 10%;
        box-shadow: 0 3px 6px rgb(222, 222, 222);
        padding: 0;
        border: none;
        font: 1em Yu Gothic UI;
        color: #9e9e9e;
    }
</style>