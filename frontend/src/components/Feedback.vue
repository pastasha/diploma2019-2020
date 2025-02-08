<template>
    <div id="app">

        <div class="container">
            <div class="nav-item">
                <router-link to="/"> <img class="logo-link" src="@/assets/logo.png"> </router-link>
            </div>
        </div>

        <div class="form-body">
            <h1>ОБРАТНАЯ СВЯЗЬ</h1>

            <div class="container-for-feedback">
                <div class="а-error-container" v-if="errors.length">
                    <p>Эти поля обязательны к заполению:</p>
                    <ul>
                        <li v-for="error in errors" :key="error.id">  -{{ error }}</li>
                    </ul>
                </div>
                <div class="feedback" v-if="showResult === 'No'">
                    <div class="f-comment">
                        <label>
                            <input class="f-form-input" type="text" placeholder="Фамилия и имя" v-model="postBody.full_name">
                        </label>
                        <label>
                            <input class="f-form-input" type="text" placeholder="Электронная почта или телефон" v-model="postBody.email_or_phone">
                        </label>
                        <label>
                            <textarea class="f-input-text" type="text" placeholder="Ваш комментарий" v-model="postBody.comment">
                            </textarea>
                        </label>

                        <button class="f-send-button" v-on:click="checkForm">ОТПРАВИТЬ</button>
                        <div class="hover-it">
                            {{postBody.picture_id = $route.params.id}}
                        </div>
                    </div>
                    <figure v-if="$route.params.preview !== ''">
                        <p><img class="preview-picture-form"
                                v-bind:src="require('@/assets/pics/preview/' + $route.params.preview)"
                                :alt="$route.params.preview"></p>
                        <figcaption>{{$route.params.title}}</figcaption>
                    </figure>
                </div>
                <div class="result-f"  v-if="showResult === 'Yes'"> <!--TODO-->
                    <p class="result-title">Благодарим за комментарий!</p>
                    <p>Ваше мнение интересно для автора, а пока предлагаем продолжить наслаждаться иссуством ;)</p>
                    <router-link to="/gallery">
                        <button class="full-picture-state">ПЕРЕЙТИ В ГАЛЕРЕЮ</button>
                    </router-link>
                </div>
            </div>
        </div>

        <SidePanel></SidePanel>
    </div>
</template>

<script>
    import SidePanel from "./SidePanel";
    import axios from "axios";

    export default {
        name: "Feedback",
        components: {SidePanel},
        data() {
            return {
                showResult: 'No',
                errors: [],
                showModal: false,
                postBody: {
                    picture_id: '',
                    full_name: '',
                    email_or_phone: '',
                    comment: ''
                }
            }
        },
        methods: {
            checkForm: function (e) {
                this.errors = [];
                if (!this.postBody.full_name) {
                    this.errors.push('имя и фамилия*');
                }
                if (!this.postBody.email_or_phone) {
                    this.errors.push('телефон или электронная почта*');
                }
                if (!this.postBody.comment) {
                    this.errors.push('комментарий*');
                }
                if (!this.errors.length) {
                    this.showModal = true;
                    this.postComment();
                } e.preventDefault();
            },
            postComment : function () {
                const str = JSON.stringify(this.postBody);
                this.showModal = '+';
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

    .f-send-button{
        position: relative;
        width: 90%;
        left: 5%;
        background-color: #F5F5F5;
        height: 30px;
        box-shadow: 0 3px 6px rgb(222, 222, 222);
        padding: 0;
        border: none;
        text-align: center;
        font: 1em Yu Gothic UI;
        color: #afafaf;
    }

    .feedback figure{
        position: absolute;
        width: 20%;
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

    .f-input-text{
        position: relative;
        background-color: white;
        box-shadow: 0 0 6px #D1D1D1;
        margin-top: 20px;
        left: 5%;
        width: 90%; /* Ширина поля в процентах */
        height: 180px; /* Высота поля в пикселах */
        resize: none;
        font: 13pt Yu Gothic UI;
        color: #302f38;
        margin-bottom: 30px;
    }

    .f-form-input{
        position: relative;
        width: 90%;
        left: 5%;
        height: 30px;
        background-color: white;
        box-shadow: 0 0 6px #D1D1D1;
        border: none;
        margin-top: 20px;
        margin-bottom: 15px;
        font: 13pt Yu Gothic UI;
        color: #302f38;
    }

    .f-comment{
        position: absolute;
        background-color: white;
        left: 0;
        top: 0;
        bottom: 0;
        height: 100%;
        width: 75%;
        margin-right: 30px;
        box-shadow: 0 0 10px #D1D1D1;
    }

    .container-for-feedback{
        position: absolute;
        left: 18%;
        top: 100px;
        bottom: 50px;
        height: 410px;
        width: 85%;
    }

    .result-f{
        margin-top: 70px;
        text-align: center;
        width: 76%;
    }

    .а-error-container{
        position: relative;
        padding: 10px 40px;
        margin-bottom: 30px;
        background-color: #ffcad2;
        box-shadow: 0 0 10px rgba(180, 0, 0, 0.56);
    }
</style>