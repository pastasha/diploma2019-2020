<template>
    <div id="app">

        <nav class="container">
            <div class="nav-item">
                <router-link to="/"> <img class="logo-link" src="@/assets/logo.png"> </router-link>
            </div>
        </nav>

        <div class="body">

            <div class="full-picture-container">
                <div class="picture-full-description">
                    <div class="picture-name-and-year-container">
                        <p class="full-title">{{ $route.params.title }}</p>
                        <p class="full-year">{{ $route.params.creation_date }}</p>
                    </div>

                    <div class="full-picture-description">
                        <p class="full-technique" v-if="$route.params.technique === 1">{{technique = 'БАТИК'}}</p>
                        <p class="full-technique" v-else-if="$route.params.technique === 0">{{technique = 'ШАРФ'}}</p>
                        <p class="full-technique" v-else-if="$route.params.technique === 2">{{technique = 'АКВАРЕЛЬ'}}</p>
                        <p class="full-technique" v-else-if="$route.params.technique === 3">{{technique = 'ЖИВОПИСЬ'}}</p>
                        <p class="f-object-size">{{ $route.params.height }} СМ х</p>
                        <p class="f-object-size">{{ $route.params.width }} СМ</p>
                        <p class="full-picture-description-item">МАТЕРИАЛЫ</p>
                        <p class="full-picture-description-itemm">{{ $route.params.materials }}</p>
                    </div>

                    <button class="full-picture-state" v-if="$route.params.status === 'a'">СОБСТВЕННОСТЬ АВТОРА</button>
                    <button class="full-picture-state" v-else-if="$route.params.status === 'p'">ПРИВАТНАЯ КОЛЛЕКЦИЯ</button>

                    <router-link :to = "{
                                  name: 'Checkout',
                                  params: {
                                      id: $route.params.id,
                                      title: $route.params.title,
                                      price: $route.params.price,
                                      preview: $route.params.preview,
                                      picture: $route.params.title+'|'+technique+'|'+$route.params.creation_date+'|'+$route.params.price+'$'
                                  }
                                }">
                        <button class="full-picture-state" v-if="$route.params.status === 's'" title="заказать картину">
                            {{ $route.params.price }}$
                        </button>
                    </router-link>

                    <p class="full-picture-moto">Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты. Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового океана. Маленький ручеек Даль журчит по всей стране и обеспечивает ее всеми необходимыми правилами. Эта парадигматическая страна, в которой жаренные члены предложения залетают прямо в рот.
                        {{ $route.params.description }}</p>
                </div>

                <div class="full-list-of-selected-picture">
                    <!--
                    <button><img class="right-arrow" src="@/assets/arrow-right.png"></button>
                    <button><img class="left-arrow" src="@/assets/arrow-left.png"></button>

                    <img class="full-picture" src="@/assets/kudiidti50x80.jpg">

                    <div v-for="photo in gallery_photos" :key="photo.id">
                        <div v-if="photo.picture === $route.params.id" v-on:timeupdate="increase">
                            <img class="full-picture" v-bind:src="require('@/assets/pics/main-photos/' + photo.image.slice(128))" :alt="$route.params.preview">
                        </div>
                    </div>
                    -->

                    <img class="full-picture" v-bind:src="require('@/assets/pics/preview/' + $route.params.preview)" :alt="$route.params.preview">

                </div>
            </div>

            <div class="comments">
                <h1>КОММЕНТАРИИИ</h1>

                <router-link :to = "{
                                  name: 'Feedback',
                                  params: {
                                      id: $route.params.id,
                                      title: $route.params.title,
                                      preview: $route.params.preview,
                                      picture: $route.params.title+'|'+technique+'|'+$route.params.creation_date+'|'+$route.params.price+'$'
                                  }
                                }">
                <button class="leave-comment">ОСТАВИТЬ КОММЕНТАРИЙ</button>
                </router-link>


                <div v-for="comment in comments" :key="comment.id">
                    <div v-if="comment.is_confirm === true && comment.picture_id.toString() === $route.params.id.toString()" class="p-comment">

                        <div class="c-description">
                            <p><strong>{{comment.full_name}}</strong></p>
                            <p class="c-comment">{{comment.comment}}</p>
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
    import {mapGetters} from "vuex";

    export default {
        name: "Picture",
        components: {SidePanel},
        computed: mapGetters(['gallery_photos', 'comments']),
        beforeMount () {
            this.$store.dispatch('getGalleryPhotos');
            this.$store.dispatch('getComments');
        },
        data() {
            return {
                sliderAllCount: 0,
                sliderActive: 0,
                sliderOffsetLeft: 0,
                sliderOffsetStep: 0,
                technique: ''
            }
        },
        methods: {
            increase: function () {
                return this.sliderAllCount++;
            },
            openSlide: function (id) {
                if (id > 0 && id <= this.sliderAllCount) {
                    this.sliderActive = id;
                    // Сдвигаем элемент со слайдами
                    this.sliderOffsetLeft = -(this.sliderActive * this.sliderOffsetStep - this.sliderOffsetStep);
                }
            },
        }
    }

</script>

<style>
    .leave-comment{
        position: relative;
        text-transform: uppercase;
        width: 100%;
        background-color: #F5F5F5;
        height: 50px;
        box-shadow: 0 0 10px rgb(200, 200, 200);
        padding: 0;
        border: none;
        text-align: center;
        font: 15pt Yu Gothic UI;
        color: #9e9e9e;
        margin-bottom: 60px;
    }

    .comments{
        position: relative;
        top: -30%;
        left: 12%;
        width: 70%;
        text-align: center;
    }

    .full-picture-moto{
        margin-top: 30px;
        font: lighter 1em Yu Gothic UI;
    }

    .full-picture-description{
        margin-top: -30px;
    }

    .f-object-size{
        text-align: center;
        text-transform: uppercase;
        font: 12pt Yu Gothic;
        display: inline-block;
        margin-bottom: 10px;
    }

    .full-picture-description-item{
        margin: 0;
        font: 1em Yu Gothic;
    }

    .full-picture-description-itemm{
        margin: 0;
        font: lighter 1em Yu Gothic UI;
    }

    .full-picture-state{
        position: relative;
        text-transform: uppercase;
        width: 350px;
        background-color: #F5F5F5;
        height: 40px;
        margin-top: 35px;
        box-shadow: 0 3px 6px rgb(222, 222, 222);
        padding: 0;
        border: none;
        text-align: center;
        font: 1em Yu Gothic UI;
        color: #9e9e9e;
    }

    .full-picture{
        position: absolute;
        top: 0;
        left : 0;
        right: 0;
        bottom: 0;
        height: 75%;
        margin-top: 2%;
        margin-left: 32%;
        border: solid 6px white;
        box-shadow: 0 0 6px #b5b5b5;
    }

    .right-arrow{
        position: absolute;
        top: 35%;
        left: 0;
        height: 60px;
    }

    .left-arrow{
        position: absolute;
        top: 35%;
        right: 0;
        height: 60px;
    }

    .full-list-of-selected-picture{
        position: absolute;
        display: inline-block;
        height: 100%;
        top: 0;
        bottom: 0;
        width: 65%;
    }

    .full-technique{
        text-transform: uppercase;
        font: 1em Yu Gothic;
        margin-bottom: 10px;
    }

    .full-year{
        position: relative;
        top: -20px;
        font: 1em Yu Gothic;
    }

    .full-title{
        display: inline-block;
        text-transform: uppercase;
        margin-bottom: 50px;
        font: 2.3em Yu Gothic;
    }

    .picture-full-description{
        position: relative;
        display: inline-block;
        width: 35%;
        top: 100px;
    }

    .full-picture-container{
        position: relative;
        display: table-cell;
        top: -70px;
        bottom: 0;
        height: 730px;
    }

    .p-comment{
        position: relative;
        height: 80px;
        margin-bottom: 30px;
        background-color: white;
        box-shadow: 0 0 10px #D1D1D1;
        left: 0;
        right: 0;
        padding: 5px 40px 15px;
    }

    .c-description{
        position: absolute;
        left: 5%;
    }

    

</style>