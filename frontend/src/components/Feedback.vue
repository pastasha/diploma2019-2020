<template>
    <div class="big-body" id="app">

        <div class="nav-item">
            <router-link to="/"> <img class="logo-link" src="@/assets/logo.png"> </router-link>
        </div>

        <div class="form-body">
            <h1>ОБРАТНАЯ СВЯЗЬ</h1>
            <div class="container-for-feedback">
                <div class="feedback">
                    <label>
                        <input class="form-input" type="text" placeholder="Фамилия и имя" v-model="postBody.full_name">
                    </label>
                    <label>
                        <input class="form-input" type="text" placeholder="Электронная почта или телефон" v-model="postBody.email_or_phone">
                    </label>
                    <label>
                        <textarea class="input-text" type="text" placeholder="Ваш комментарий" v-model="postBody.comment">
                        </textarea>
                    </label>

                    <button class="send-button" v-on:click="postComment">ОТПРАВИТЬ</button>
                    <div class="hover-it">
                        {{postBody.picture = $route.params.picture}}
                    </div>
                </div>
                <div class="commented_picture">
                    <figure>
                        <p><img class="preview-picture-form"
                                v-bind:src="require('@/assets/pics/preview/' + $route.params.preview)"
                                :alt="$route.params.preview"></p>
                        <figcaption>{{$route.params.title}}</figcaption>
                    </figure>
                </div>
            </div>
        </div>

        <SidePanel></SidePanel>
    </div>
</template>

<script>
    import SidePanel from "./SidePanel";
    import axios from "axios";

    let now = new Date();
    now = now.toString();
    export default {
        name: "Feedback",
        components: {SidePanel},
        data() {
            return {
                showResult: 'No',
                postBody: {
                    picture: '',
                    full_name: '',
                    email_or_phone: '',
                    comment: '',
                    datetime: now.slice(3,21)
                }
            }
        },
        methods: {
            postComment : function () {
                const str = JSON.stringify(this.postBody);
                this.showResult = 'Yes';
                axios.post('http://localhost:8000/bot/comment-form/', str);
            }
        }
    }
</script>

<style>
    .hover-it{
        opacity: 0;
    }

    .send-button{
        width: 100%;
        left: 20px;
        background-color: #F5F5F5;
        height: 50px;
        margin-bottom: 60px;
        box-shadow: 0 3px 6px rgb(222, 222, 222);
        padding: 0;
        border: none;
        text-align: center;
        font: 15pt Yu Gothic UI;
        color: #afafaf;
    }

    .commented_picture{
        position: absolute;
        top: 0;
        right: 0;
        padding-bottom: 20px;
        box-shadow: 0 0 6px #D1D1D1;
    }

    input, textarea{
        outline:none;
        padding: 10px;
        border: none;
        font: inherit;
        color: inherit;
        background-color: transparent;
    }

    .input-text{
        background-color: white;
        box-shadow: 0 0 6px #D1D1D1;
        margin-top: 20px;
        width: 100%; /* Ширина поля в процентах */
        height: 180px; /* Высота поля в пикселах */
        resize: none;
        font: 13pt Yu Gothic UI;
        color: #cbcbcb;
        margin-bottom: 30px;
    }

    .form-input{
        width: 100%;
        height: 40px;
        background-color: white;
        box-shadow: 0 0 6px #D1D1D1;
        border: none;
        margin-bottom: 15px;
        font: 13pt Yu Gothic UI;
        color: #cbcbcb;
    }

    .feedback{
        position: absolute;
        background-color: white;
        left: 0;
        top: 0;
        bottom: 0;
        width: 62%;
        padding-top: 55px;
        padding-left: 30px;
        padding-right: 30px;
        box-shadow: 0 0 10px #D1D1D1;
    }

    .container-for-feedback{
        position: absolute;
        left: 30px;
        top: 150px;
        bottom: 50px;
        height: 500px;
        width: 900px;
    }

</style>